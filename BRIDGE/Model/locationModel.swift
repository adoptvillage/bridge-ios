//
//  locationModel.swift  
//  Created on 26/09/20
//  Created for Bridge - Adopt Your Village
//

import Foundation

struct Location: Codable {
    var states: [States]
}

struct States: Codable {
    var state: String
    var districts: [String]
}


// Village Model
struct VillageData: Codable {
    var data: [District]
}

struct District: Codable {
    var district: String
    var subDistricts: [Area]
    
    enum CodingKeys: String, CodingKey {
        case district
        case subDistricts = "sub-districts"
    }
}

struct Area: Codable {
    var subDistrict: String
    var villages: [String]
    
    enum CodingKeys: String, CodingKey {
        case villages
        case subDistrict = "sub-district"
    }
}
