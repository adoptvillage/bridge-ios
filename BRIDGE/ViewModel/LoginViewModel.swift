//
//  LoginViewModel.swift
//  Created on 11/09/20
//  Created for Bridge - Adopt Your Village
//

import Foundation
import Combine
import FirebaseAuth

class LoginViewModel: ObservableObject {
    
    @Published var loginResponse = LoginModel.LoginResponseData(message: "")
    private var cancellable: AnyCancellable?
    @Published var inActivity: Bool = false
    
    func loginUser(email: String, password: String, completion: @escaping (String) -> Void ) {
        self.inActivity = true
        Auth.auth().signIn(withEmail: email, password: password) { (authRes, error) in
            if error != nil {
                if let errorMessage = error?.localizedDescription {
                    completion(errorMessage)
                }
                self.inActivity = false
            }
            guard let authRes = authRes else { return }
            if !authRes.user.isEmailVerified {
                completion("Please Verify your email address first")
                self.inActivity = false
            }
            UserDefaults.standard.set(true, forKey: UserDefaultsConstants.isLoggedIn)
            self.inActivity = false
        }
        
    }
}
