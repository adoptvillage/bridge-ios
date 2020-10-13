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
    
    var validPartialAmount: Bool {
        if Int(partialAmount) ?? 0 > Int(applicationDetail.remainingAmount) {
            return false
        } else {
            return true
        }
    }
    
    var disabledAcceptButton: Bool {
        (moderator.isEmpty || !moderator.isValidEmail()) || (!donatingfullAmount && partialAmount == "" || partialAmount == "0" || !partialAmount.isNumber || !validPartialAmount) && (!donatingfullAmount)
    }
    
    var body: some View {
        Form {
            Section {
                HStack(alignment: .center){
                    Text("Institute").foregroundColor(Color.secondary)
                        .frame(width: 120)
                    Divider()
                    Text("\(applicationDetail.instituteName)")
                    Spacer()
                }
                HStack(alignment: .center){
                    Text("Amount needed").foregroundColor(Color.secondary)
                        .frame(width: 120)
                    Divider()
                    Text("₹\(applicationDetail.remainingAmount)")
                    Spacer()
                }
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
                    Text("Active donors").foregroundColor(Color.secondary)
                        .frame(width: 120)
                    Divider()
                    Text("\(applicationDetail.numberOdActiveDonor)")
                    Spacer()
                }
            }.padding(5)
            Section(footer: Text("Please add/invite a moderator in order to accept the application")) {
                TextField("Moderator email", text: $moderator)
                    .autocapitalization(.none)
                
            }
            
            Section {
                
                Toggle(isOn: $donatingfullAmount) {
                    Text("Donate full Amount")
                }
            }
            if !donatingfullAmount {
                Section {
                    TextField("Amount", text: $partialAmount)
                        .keyboardType(.numberPad)
                }
            }
            
            Section {
                Button(action: {
                    let acceptData = ApplicationModel.AcceptData(applicationId: applicationDetail.id, donatingFullAmount: donatingfullAmount, amount: (donatingfullAmount ? Int(applicationDetail.remainingAmount) : Int(partialAmount)) ?? 0 , moderatorEmail: moderator)
                    print(acceptData)
                    applicationViewModel.acceptApplication(application: acceptData) { (response) in
                        alertMessage = response.message
                        showAlert.toggle()
                    }

                    
                }) {
                    HStack {
                        Text("Accept Application")
                            .foregroundColor(disabledAcceptButton ? Color(.systemGray) : Color(.systemIndigo))
                        Spacer()
                        ActivityIndicator(isAnimating: $applicationViewModel.inActivity)
                    }
                    
                }
                .disabled(disabledAcceptButton)
            }
        }
        
        .navigationBarTitle(Text("\(applicationDetail.firstName) \(applicationDetail.lastName)"))
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertMessage), dismissButton: .default(Text("OK")) {
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
