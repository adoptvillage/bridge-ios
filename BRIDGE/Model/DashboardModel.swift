//
//  DashboardModel.swift
//  Created on 05/11/20
//  Created for Bridge - Adopt Your Village
//

import Foundation

final class DashboardModel {
    
    struct DashboardResponse: Codable {
        var role: Int?
        var applications: [ApplicationData]
        
    }
    struct ApplicationData: Codable, Identifiable {
        var id: Int
        var applicantFirstName: String
        var applicantLastName: String
        var state: String
        var district: String
        var subDistrict: String
        var area: String
        var noOfDonors: Int
        var description: String
        var institute: String
        var instituteState: String
        var instituteDistrict: String
        var offerLetter: String
        var feeStructure: String
        var bankStatement: String
        var donorId: String
        var recipientId: String
        var moderatorId: String
        var donorName: String
        var moderatorName: String
        var status: Int
        var reservedApplicationnId: Int
        var donationAmount: Int
        
        enum CodingKeys: String, CodingKey {
            case id, state, district, area, institute, status, description
            case applicantFirstName = "applicant_first_name"
            case applicantLastName = "applicant_last_name"
            case subDistrict = "sub_district"
            case noOfDonors = "no_of_donors"
            case instituteState = "institute_state"
            case instituteDistrict = "institute_district"
            case offerLetter = "offer_letter"
            case feeStructure = "fee_structure"
            case bankStatement = "bank_statement"
            case donorId = "donor_id"
            case recipientId = "recipient_id"
            case moderatorId = "moderator_id"
            case donorName = "donor_name"
            case moderatorName = "moderator_name"
            case reservedApplicationnId = "reserved_application_id"
            case donationAmount = "donating_amount"
            
        }
    }
    
    
}
