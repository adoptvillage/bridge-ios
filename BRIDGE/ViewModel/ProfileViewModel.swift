//
//  ProfileViewModel.swift
//  Created on 11/09/20
//  Created for Bridge - Adopt Your Village
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    
    let profileData = ProfileModel.ProfileData(id: 0, firebaseId: "", name: "", email: "", isVerified: false, profileImage: "", address: "", location: "", occupation: "", isDonor: false, isRecipient: false, isModerator: false)
    private var cancellable: AnyCancellable?
    
    
    func getProfile(completion: @escaping (ProfileModel.ProfileData) -> Void) {
        //get auth token
        guard let token = try? KeychainManager.getToken() else {
            return
        }
        print(token)
        
        //parallel request for profile and home
        cancellable = NetworkManager.callAPI(urlString: URLStringConstants.User.profile, token: token)
            .receive(on: RunLoop.main)
            .catch { _ in Just(self.profileData) }
            .sink { profile in
                print(profile.location)
                completion(profile)
            }
    }
    
    func logout() {
        //delete keychain item
        do {
            try KeychainManager.deleteToken()
        } catch {
            fatalError()
        }
        //go to login screen
        UserDefaults.standard.set(false, forKey: UserDefaultsConstants.isLoggedIn)
    }
    
    struct ProfileNetworkResponse: Decodable {
        var profile: ProfileModel.ProfileData?
        let message: String?
    }
}
