//
//  SignUpViewModel.swift
//  Created on 10/09/20
//  Created for Bridge - Adopt Your Village
//

import Foundation
import Combine

class SignUpViewModel: ObservableObject {
    private var cancellable: AnyCancellable?
    
    @Published var signUpResponseData = SignUpModel.SignUpResponseData(message: "")
     @Published var inActivity: Bool = false
    
    
    func registerUser(
        roleSelection: Int,
        signUpData: SignUpModel.SignUpRequestData,
        confirmPassword: String,
        completion: @escaping (SignUpModel.SignUpResponseData) -> Void
    ) {
        
        self.inActivity = true
        
        // make variable for sign up data
        var signUpData = signUpData
        
        //assign role as per picker selection
        signUpData.role = roleSelection
        

        //check password fields
        if signUpData.password != confirmPassword {
            let signUpResponseData = SignUpModel.SignUpResponseData(message: "Password did not match")
            completion(signUpResponseData)
            return
        }

        //encode upload data
        guard let uploadData = try? JSONEncoder().encode(signUpData) else {
            return
        }
        
        //api call
        cancellable = NetworkManager.callAPI(urlString: URLStringConstants.User.register, httpMethod: "POST", uploadData: uploadData)
        .receive(on: RunLoop.main)
        .catch { _ in Just(self.signUpResponseData) }
        .sink(receiveCompletion: { _ in
            self.inActivity = false
        }, receiveValue: { value in
            self.signUpResponseData = value
            completion(value)
        })
    }
    
    func update(using data: SignUpModel.SignUpResponseData) {
        signUpResponseData = data
    }
    
    struct SignUpNetworkModel: Decodable {
        var message: String?
    }

}
