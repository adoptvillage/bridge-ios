//
//  CardView1.swift
//  Created on 09/10/20
//  Created for Bridge - Adopt Your Village
//

import Foundation
import SwiftUI

struct HistoryCard : View{
    
    var historyDetail: HistoryModel.ApplicationHistory
    
    var body: some View{
        
        VStack(spacing: 0) {
            HStack(spacing : 15){
                
                VStack(alignment: .leading, spacing: 0){
                    HStack(spacing: 5){
                        Text("Recipient")
                            .frame(width: 90)
                        Divider()
                        
                        Text(historyDetail.recipientName)
                            .foregroundColor(Color(.systemIndigo))
                            .padding(.leading, 10)
                    }
                   // Divider()
                    
                    HStack(spacing: 5){
                        Text("Donor")
                            .frame(width: 90)
                        Divider()
                        Text(historyDetail.donorName)
                            .foregroundColor(Color(.systemIndigo))
                            .padding(.leading, 10)
                    }
                   // Divider()
                    
                    HStack(spacing: 5){
                        Text("Moderator")
                            .frame(width: 90)
                        Divider()
                        Text(historyDetail.moderatorName)
                            .foregroundColor(Color(.systemIndigo))
                            .padding(.leading, 10)
                    }
                    
                    
                }
                Spacer()
                VStack(spacing: 5){
                    Text("Donated")
                    Text("₹\(String(historyDetail.amount))")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(Color(.white))
                  //      .padding(.bottom)
                    Text(historyDetail.donationDate)
                        .font(.footnote)
                        .foregroundColor(Color(.white))
                        
                }
                .frame(width: 120, height: UIScreen.main.bounds.height / 7)
                .background(Color(.systemIndigo))
            }
            
        }
        .padding(.top, 10)
        .padding(.bottom, 10)
        .padding(.leading, 10)
        .frame(width: UIScreen.main.bounds.width - 40)
        .frame(height : UIScreen.main.bounds.height / 7)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(20)
        
    }
}
