//
//  LoginViewModel.swift
//  Created on 11/09/20
//  Created for Bridge - Adopt Your Village
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    
    @Published var loginResponse = LoginModel.LoginResponseData(message: "")
    private var cancellable: AnyCancellable?
    @Published var inActivity: Bool = false
    
    func loginUser(email: String, password: String,
                   completion: @escaping (LoginModel.LoginResponseData) -> Void) {
        self.inActivity = true
        
        let loginRequestData = LoginModel.LoginRequestData(email: email, password: password)
        
        if !email.isValidEmail() {
            let loginResponse = LoginModel.LoginResponseData(message: "Enter valid email address")
            completion(loginResponse)
            self.inActivity = false
            return
        }
        
        guard let uploadData = try? JSONEncoder().encode(loginRequestData) else {
            self.inActivity = false
            return
        }
        
        cancellable = NetworkManager.callAPI(urlString: URLStringConstants.User.login, httpMethod: "POST", uploadData: uploadData)
            .receive(on: RunLoop.main)
            .catch { _ in Just(LoginNetworkModel(message: CustomString.networkErrorString, error: nil)) }
            .sink(receiveCompletion: { _ in
                self.inActivity = false
            }, receiveValue: { response in
                var loginResponse = LoginModel.LoginResponseData(message: response.message)
                
                if response.error != nil {
                    loginResponse.message = response.error?.message
                }
                
                if let token = response.idToken {
                    do {
                        try KeychainManager.setToken(email: email, tokenString: token)
                        UserDefaults.standard.set(true, forKey: UserDefaultsConstants.isLoggedIn)
                    } catch {
                        loginResponse.message = "Failed to save access token"
                    }
                    guard let token = try? KeychainManager.getToken() else {
                        return
                    }
                    
                    print(token)
                }
                
                completion(loginResponse)
            })
        
    }
    struct LoginNetworkModel: Decodable {
        
        var message: String?
        var idToken: String?
        var localId: String?
        let error: NetworkError?
        
    }
    struct NetworkError: Decodable {
        var code: Int?
        var message: String?
    }
}
