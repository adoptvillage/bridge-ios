//
//  SubmitApplicationModel.swift
//  Created on 05/10/20
//  Created for Bridge - Adopt Your Village
//

import Foundation

final class SubmitApplicationModel {
    
    struct SubmitData: Codable {
        var firstName: String!
        var lastName: String!
        var contactNumber: String!
        var aadhaarNumber: String!
        var state: String!
        var district: String!
        var subDistrict: String!
        var area: String!
        var instituteName: String!
        var instituteState: String!
        var instituteDistrict: String!
        var instituteAffiliationCode: String!
        var courseName: String!
        var yearOrSemester: String!
        var amount: String!
        var offerLetter: String!
        var feeStructure: String!
        var bankStatement: String!
        
        enum CodingKeys: String, CodingKey {
            case state, district, area, amount
            case firstName = "applicant_first_name"
            case lastName = "applicant_last_name"
            case contactNumber = "contact_number"
            case aadhaarNumber = "aadhaar_number"
            case subDistrict = "sub_district"
            case instituteName = "institute_name"
            case instituteState = "institute_state"
            case instituteDistrict = "institute_district"
            case instituteAffiliationCode = "institution_affiliation_code"
            case courseName = "course_name"
            case yearOrSemester = "year_or_semester"
            case offerLetter = "offer_letter"
            case feeStructure = "fee_structure"
            case bankStatement = "bank_statement"
            
        }
    }
    
    struct NetworkResponse: Codable {
        var message: String!
    }
    
}
