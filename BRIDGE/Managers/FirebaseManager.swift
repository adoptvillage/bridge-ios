//
//  FirebaseManager.swift
//  Created on 02/10/20
//  Created for Bridge - Adopt Your Village
//

import Foundation
import FirebaseAuth

struct FirebaseManager {
    static func getToken(completion: @escaping (String) -> Void) {
        let user = Auth.auth().currentUser
        user?.getIDToken(completion: { (token, error) in
            if error != nil {
                print("Cannot get ID Token")
            }
            if let token = token {
                completion(token)
            }
            
        })
        
    }
}
