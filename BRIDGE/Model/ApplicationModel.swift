//
//  ApplicationModel.swift
//  Created on 12/10/20
//  Created for Bridge - Adopt Your Village
//

import Foundation

final class ApplicationModel {
    
    struct ApplicationData: Codable, Identifiable {
        var id: Int
        var firstName: String!
        var lastName: String!
        var state: String!
        var district: String!
        var subDistrict: String!
        var area: String!
        var instituteName: String!
        var remainingAmount: Int!
        var numberOdActiveDonor: Int!
        var description: String!
        
        enum CodingKeys: String, CodingKey {
            case id, state, district, area, description
            case firstName = "applicant_first_name"
            case lastName = "applicant_last_name"
            case subDistrict = "sub_district"
            case instituteName = "institute"
            case remainingAmount = "remaining_amount"
            case numberOdActiveDonor = "no_of_donors"
            
        }
    }
    
    struct AcceptData: Codable {
        var applicationId: Int
        var donatingFullAmount: Bool
        var amount: Int
        var moderatorEmail: String
        
        enum CodingKeys: String, CodingKey {
            case amount
            case applicationId = "application_id"
            case donatingFullAmount = "donating_full_amount"
            case moderatorEmail = "moderator_email"
        }
    }
    
    struct NetworkResponse: Codable {
        var message: String!
    }
    
}
