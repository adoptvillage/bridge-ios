//
//  UserDeafults+Ext.swift
//  Created on 11/09/20
//  Created for Bridge - Adopt Your Village
//

import Foundation

extension UserDefaults {
        @objc dynamic var isLoggedIn: Bool {
        return bool(forKey: UserDefaultsConstants.isLoggedIn)
    }
}
