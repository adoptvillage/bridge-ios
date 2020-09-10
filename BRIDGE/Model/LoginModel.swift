//
//  LoginModel.swift
//  Created on 10/09/20
//  Created for Bridge - Adopt Your Village
//

final class LoginModel {
    
    struct LoginRequestData: Codable {
        var email: String
        var password: String
    }
    
    struct LoginResponseData: Codable {
        var token_id: String
    }
    
}
