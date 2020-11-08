//
//  ProfileViewModel.swift
//  Created on 11/09/20
//  Created for Bridge - Adopt Your Village
//

import Foundation
import Combine
import FirebaseAuth

class ProfileViewModel: ObservableObject {
    
    var profileData = ProfileModel.ProfileData(id: 0, firebaseId: "", name: "", email: "", isVerified: false, profileImage: "", address: "", location: "", occupation: "", isDonor: false, isRecipient: false, isModerator: false)
    var profileUpdateResponseData = ProfileModel.NetworkResponse(message: "")
    @Published var preferredLocation = PreferredLocationModel.LocationResponse(state: "", district: "", subDistrict: "", area: "")
    private var cancellable: AnyCancellable?
    @Published var inActivity: Bool = false
    
    
    func getProfile(completion: @escaping (ProfileModel.ProfileData) -> Void) {
        inActivity = true
        FirebaseManager.getToken { (token) in
            self.cancellable = NetworkManager.callAPI(urlString: URLStringConstants.User.profile, token: token)
                .receive(on: RunLoop.main)
                .catch { _ in Just(self.profileData) }
                .sink { profile in
                    self.profileData = profile
                    self.inActivity = false
                    completion(profile)
                }
        }
        
    }
    
    func updateProfile(profileUpdateData: ProfileModel.ProfileUpdateData, completion: @escaping (String) -> Void) {
        inActivity = true
        guard let uploadData = try? JSONEncoder().encode(profileUpdateData) else {
            return
        }
        
        FirebaseManager.getToken { (token) in
            self.cancellable = NetworkManager.callAPI(urlString: URLStringConstants.User.profile, httpMethod: "PUT", uploadData: uploadData, token: token)
                .receive(on: RunLoop.main)
                .catch { _ in Just(self.profileUpdateResponseData) }
                .sink { response in
                    self.inActivity = false
                    completion(response.message)
                }
        }
        
    }
    
    func getPreferredLocation(completion: @escaping (PreferredLocationModel.LocationResponse) -> Void) {
        inActivity = true
        FirebaseManager.getToken { (token) in
            self.cancellable = NetworkManager.callAPI(urlString: URLStringConstants.User.preferredLocation, token: token)
                .receive(on: RunLoop.main)
                .catch { _ in Just(self.preferredLocation) }
                .sink { preferredLocation in
                    self.inActivity = false
                    completion(preferredLocation)
                }
        }
        
    }
    
    func updatePreferredLocation(preferredLocationUploadData: PreferredLocationModel.LocationResponse, completion: @escaping (String) -> Void) {
        inActivity = true
        guard let uploadData = try? JSONEncoder().encode(preferredLocationUploadData) else {
            return
        }
        
        FirebaseManager.getToken { (token) in
            self.cancellable = NetworkManager.callAPI(urlString: URLStringConstants.User.preferredLocation, httpMethod: "POST", uploadData: uploadData, token: token)
                .receive(on: RunLoop.main)
                .catch { _ in Just(self.profileUpdateResponseData) }
                .sink { response in
                    self.inActivity = false
                    completion(response.message)
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
