//
//  AcceptApplicationView.swift
//  Created on 16/10/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct AcceptApplicationView: View {
    var applicationDetail: ApplicationModel.ApplicationData
    @ObservedObject var applicationViewModel: ApplicationViewModel
    @Binding var isPresented: Bool

    @State var moderator = ""
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
        NavigationView {
        Form {
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
                        Text("Invite Moderator")
                            .foregroundColor(disabledAcceptButton ? Color(.systemGray) : Color(.systemIndigo))
                        Spacer()
                        ActivityIndicator(isAnimating: $applicationViewModel.inActivity)
                    }
                    
                }
            }.disabled(disabledAcceptButton)
        }
        .alert(isPresented: $showAlert) {
                Alert(title: Text(alertMessage), dismissButton: .default(Text("OK")) {
                        isPresented = false            })
            }
            .navigationBarTitle(Text("Accept Application"))
            .navigationBarItems(leading:
                                    Button.init(action: {
                                        self.isPresented = false
                                    }, label: {
                                        Image(systemName: "x.circle.fill")
                                            .font(.headline)
                                            .accentColor(.secondary)
                                    }))
    }
    }
}
