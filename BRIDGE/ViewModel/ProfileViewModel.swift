//
//  ProfileViewModel.swift
//  Created on 11/09/20
//  Created for Bridge - Adopt Your Village
//

import Foundation
import Combine
import FirebaseAuth

class ProfileViewModel: ObservableObject {
    
    let profileData = ProfileModel.ProfileData(id: 0, firebaseId: "", name: "", email: "", isVerified: false, profileImage: "", address: "", location: "", occupation: "", isDonor: false, isRecipient: false, isModerator: false)
    private var cancellable: AnyCancellable?
    
    
    func getProfile(completion: @escaping (ProfileModel.ProfileData) -> Void) {
        
        FirebaseManager.getToken { (token) in
            self.cancellable = NetworkManager.callAPI(urlString: URLStringConstants.User.profile, token: token)
                .receive(on: RunLoop.main)
                .catch { _ in Just(self.profileData) }
                .sink { profile in
                    completion(profile)
                }
        }
        
    }
    
    func logout() {
        //delete keychain item
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        UserDefaults.standard.set(false, forKey: UserDefaultsConstants.isLoggedIn)
    }
    
    
}
