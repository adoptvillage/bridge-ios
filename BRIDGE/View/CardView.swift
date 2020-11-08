//
//  CardView.swift
//  Created on 02/10/20
//  Created for Bridge - Adopt Your Village
//

import Foundation
import SwiftUI

struct CardView : View{
    var applicationData: DashboardModel.ApplicationData
    var body: some View{
        
        VStack(alignment: .leading, spacing: 12) {
            
            Text(applicationData.applicantFirstName + " " + applicationData.applicantLastName)
                .fontWeight(.bold)
                .font(.system(size: 21))
                .foregroundColor(Color(.systemIndigo))
                .padding(.top)
                .padding(.bottom, 5)
            HStack(spacing : 10){
                
                VStack(alignment: .leading, spacing: 10){
                    HStack(spacing: 10){
                        Text("Donor")
                            .frame(width: 120)
                        Divider()
                        
                        Text(applicationData.donorName)
                            .foregroundColor(Color(.systemIndigo))
                            .padding(.leading, 50)
                    }
                    Divider()
                    
                    HStack(spacing: 10){
                        Text("Moderator")
                            .frame(width: 120)
                        Divider()
                        Text(applicationData.moderatorName)
                            .foregroundColor(Color(.systemIndigo))
                            .padding(.leading, 50)
                    }
                    Divider()
                    
                    HStack(spacing: 10){
                        Text("Amount")
                            .frame(width: 120)
                        Divider()
                        Text("₹" + String(applicationData.donationAmount))
                            .foregroundColor(Color(.systemIndigo))
                            .padding(.leading, 50)
                    }
                    HStack{
                        VStack{
                            Capsule()
                                .fill(Color.green)
                                .frame(width: UIScreen.main.bounds.width/4, height: 5)
                            
                            Text("Submitted")
//                                                    .fontWeight(.thin)
                                .font(.system(size: 12))
                                .frame(width: UIScreen.main.bounds.width/4, height: 20)
                            
                            
                        }
                        VStack{
                            Capsule()
                                .fill(applicationData.status == 1 || applicationData.status == 2 ? Color.green : Color.gray)
                                .frame(width: UIScreen.main.bounds.width/4, height: 5)
                            
                            Text("Being Reviewed")
//                                                    .fontWeight(.thin)
                                .font(.system(size: 12))
                                .frame(width: UIScreen.main.bounds.width/4, height: 20)
                        }
                        VStack{
                            Capsule()
                                .fill(applicationData.status == 2 ? Color.green : Color.gray)
                                .frame(width: UIScreen.main.bounds.width/4, height: 5)
                            
                            Text("Verified")
//                                                    .fontWeight(.thin)
                                .font(.system(size: 12))
                                .frame(width: UIScreen.main.bounds.width/4, height: 20)
                        }
                        
                    }.frame(alignment: .center)
                    .padding(.vertical)
                    
                }
            }
        }
        .padding(.all)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(20)
        
    }
}
