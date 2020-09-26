//
//  ProfileModel.swift
//  Created on 15/09/20
//  Created for Bridge - Adopt Your Village
//

import Foundation
final class ProfileModel {

    // MARK: - Structures
    struct ProfileData: Codable {
        var id: Int
        var firebaseId: String
        var name: String?
        var email: String?
        var isVerified: Bool?
        var profileImage: String?
        var address: String?
        var location: String?
        var occupation: String?
        var isDonor: Bool
        var isRecipient: Bool
        var isModerator: Bool
        

        enum CodingKeys: String, CodingKey {
            case id, name, email, occupation
            case firebaseId = "firebase_id"
            case isVerified = "is_email_verified"
            case profileImage = "profile_image"
            case isDonor = "is_donor"
            case isRecipient = "is_recipient"
            case isModerator = "is_moderator"
        }
    }

}
