//
//  HistoryModel.swift
//  Created on 08/11/20
//  Created for Bridge - Adopt Your Village
//

import Foundation

final class HistoryModel {
    struct HistoryResponse: Codable {
        var role: Int
        var history: [ApplicationHistory]
    }
    
    struct ApplicationHistory: Codable, Identifiable {
        var id = UUID()
        var recipientName: String
        var moderatorName: String
        var donorName: String
        var amount: Int
        var donationDate: String
        
        enum CodingKeys: String, CodingKey {
            case amount
            case recipientName = "recipient_name"
            case moderatorName = "moderator_name"
            case donorName = "donor_name"
            case donationDate = "donation_date"
            
        }
    }
    
    struct QuarterWiseData {
        var quarter: Int
        var amount: Int
    }
    
}
