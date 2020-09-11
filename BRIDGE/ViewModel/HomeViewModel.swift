//
//  HomeViewModel.swift
//  Created on 11/09/20
//  Created for Bridge - Adopt Your Village
//

import Foundation

class HomeViewModel: ObservableObject {
    
    
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
}
