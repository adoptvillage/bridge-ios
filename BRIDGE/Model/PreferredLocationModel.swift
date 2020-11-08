//
//  PreferredLocationModel.swift
//  Created on 08/11/20
//  Created for Bridge - Adopt Your Village
//

import Foundation

final class PreferredLocationModel {
    struct LocationResponse: Codable {
        var state: String
        var district: String
        var subDistrict: String
        var area: String
        
        enum CodingKeys: String, CodingKey {
            case state, district, area
            case subDistrict = "sub_district"
        }
        
    }
    
    struct NetworkResponse: Codable {
        var message: String
    }
    
}
