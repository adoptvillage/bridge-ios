//
//  SignUpModel.swift
//  Created on 10/09/20
//  Created for Bridge - Adopt Your Village
//

import Foundation

final class SignUpModel {
    
    struct SignUpRequestData: Encodable {
        var name: String
        var email: String
        var password: String
        var role: Int
    }
    
    struct SignUpResponseData: Codable {
        var verify_link: String
        var message: String
    }
    
}
