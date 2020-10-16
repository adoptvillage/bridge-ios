//
//  ApplicationDetailView.swift
//  Created on 12/10/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct ApplicationDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var applicationDetail: ApplicationModel.ApplicationData
    @ObservedObject var applicationViewModel: ApplicationViewModel
    @State var moderator = ""
    @State var addedModerator = false
    //    @State var donatingAmountSelection = 0
    @State var partialAmount = ""
    @State var donatingfullAmount = false
    @State var showAlert = false
    @State var alertMessage = ""
    @State var showAcceptScreen = false
    
    var body: some View {
        Form {
            Section(header: Text("Recipient Details")) {
               
                HStack(alignment: .center){
                    Text("Location").foregroundColor(Color.secondary)
                        .frame(width: 120)
                    Divider()
                    if applicationDetail.subDistrict.isEmpty && applicationDetail.area.isEmpty {
                        Text("\(applicationDetail.state), \(applicationDetail.district)")
                    } else {
                        Text("\(applicationDetail.state), \(applicationDetail.district), \(applicationDetail.subDistrict), \(applicationDetail.area)")
                            .multilineTextAlignment(.leading)
                    }
                    Spacer()
                }
                HStack(alignment: .center){
                    Text("Amount Needed").foregroundColor(Color.secondary)
                        .frame(width: 120)
                    Divider()
                    Text("₹\(applicationDetail.remainingAmount)")
                    Spacer()
                }
            }.padding(5)
            
            Section(header: Text("Institute Details")) {
                HStack(alignment: .center){
                    Text("Name").foregroundColor(Color.secondary)
                        .frame(width: 120)
                    Divider()
                    Text("\(applicationDetail.instituteName)")
                    Spacer()
                }
                HStack(alignment: .center){
                    Text("District").foregroundColor(Color.secondary)
                        .frame(width: 120)
                    Divider()
                    Text("\(applicationDetail.instituteDistrict)")
                    Spacer()
                }
                HStack(alignment: .center){
                    Text("State").foregroundColor(Color.secondary)
                        .frame(width: 120)
                    Divider()
                    Text("\(applicationDetail.instituteState)")
                    Spacer()
                }
            }
            
            Section(header: Text("Note from Recipient")) {
                Text(applicationDetail.description)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Section {
                Button(action: {
                    showAcceptScreen.toggle()
                }) {
                    HStack {
                        Text("Accept Application")
                            .foregroundColor(Color(.systemIndigo))
                        Spacer()
                    }
                    
                }
            }
            
        }
        
        .navigationBarTitle(Text("\(applicationDetail.firstName) \(applicationDetail.lastName)"))
        
        .sheet(isPresented: $showAcceptScreen) {
            AcceptApplicationView(applicationDetail: applicationDetail, applicationViewModel: applicationViewModel, isPresented: $showAcceptScreen)
        }
    }
}
