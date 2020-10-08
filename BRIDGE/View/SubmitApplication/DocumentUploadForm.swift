//
//  DocumentUploadForm.swift
//  Created on 05/10/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct DocumentUploadForm: View {
    @Binding var shouldPopToRootView : Bool
    var applicationFormViewModel: SubmitApplicationViewModel!
    @ObservedObject var documentUploadViewModel = DocumentUploadViewModel()
    @State var showProgressBar = false
    @State var showDocumentPicker = false
    @State var addedAllFiles = false
    @State var selectedButton = 0
    @State var uploadedItemsUrls:[URL] = []
    @State var showAlert = false
    @State var alertMessage = ""
    var body: some View {
        Form {
            Section(header: Text("Upload Documents")) {
                Button(action: {
                    self.showDocumentPicker.toggle()
                    selectedButton = 1
                }) {
                    HStack {
                        Text("Offer Letter")
                            .foregroundColor(selectedButton == 2 ? Color(.systemGray) : Color(.label))
                        Spacer()
                        Image(systemName: "paperclip")
                            .foregroundColor(Color(.systemIndigo))
                    }
                    
                }.disabled(selectedButton == 2 ? true : false)
                Button(action: {
                    self.showDocumentPicker.toggle()
                    selectedButton = 2
                }) {
                    HStack {
                        Text("Fee Structure")
                            .foregroundColor(selectedButton == 1 || addedAllFiles ? Color(.label) : Color(.systemGray))
                        Spacer()
                        Image(systemName: "paperclip")
                            .foregroundColor(Color(.systemIndigo))
                        
                    }.foregroundColor(Color(.systemIndigo))
                }.disabled(selectedButton == 1 ||  addedAllFiles ? false : true)
                Button(action: {
                    self.showDocumentPicker.toggle()
                    selectedButton = 3
                }) {
                    HStack {
                        Text("Bank Statement")
                            .foregroundColor(selectedButton == 2 || addedAllFiles ? Color(.label) : Color(.systemGray))
                        Spacer()
                        Image(systemName: "paperclip")
                            .foregroundColor(Color(.systemIndigo))
                    }
                }.disabled(selectedButton == 2 || addedAllFiles ? false : true)
            }
            Section(footer: Text("Please select different files for each document. File size must be less than 5MB")) {
            }
            Section {
                VStack {
                    if #available(iOS 14.0, *) {
                        if showProgressBar {
                            let progressStatus = documentUploadViewModel.doneUpload ? "Done" : "Uploading..."
                            ProgressView(progressStatus, value: documentUploadViewModel.progress, total: 300)
                        }
                    } else {
                        // Fallback on earlier versions
                    }
                    Button(action: {
                        //                    print(uploadedItemsUrls)
                        showProgressBar = true
                        documentUploadViewModel.getDocumentDetails(uploadedItemsUrls: uploadedItemsUrls)
                    }) {
                        Text("Upload")
                    }.disabled(documentUploadViewModel.doneUpload || documentUploadViewModel.progress > 1 || !addedAllFiles)
                }
                
                
            }.foregroundColor(documentUploadViewModel.doneUpload || documentUploadViewModel.progress > 1 ? Color(.systemGray) : !addedAllFiles ? Color(.systemGray) : Color(.systemIndigo))
            .alert(isPresented: $documentUploadViewModel.showAlert) {
            Alert(title: Text("Alert!"), message: Text(documentUploadViewModel.alertMessage), dismissButton: .default(Text("OK")))
        }
            
            Section {
                Button(action: {
                    applicationFormViewModel.applicationData.offerLetter = documentUploadViewModel.docModel.offerLetter
                    applicationFormViewModel.applicationData.feeStructure = documentUploadViewModel.docModel.feeStructure
                    applicationFormViewModel.applicationData.bankStatement = documentUploadViewModel.docModel.bankStatement
                    applicationFormViewModel.submitApplication { (message) in
                        alertMessage = message
                        showAlert.toggle()
                       
                    }
                }) {
                    Text("Submit")
                        .foregroundColor(!documentUploadViewModel.doneUpload ? Color(.systemGray) : Color(.systemIndigo))
                }.disabled(!documentUploadViewModel.doneUpload)
                
            }.alert(isPresented: $showAlert) {
                Alert(title: Text(alertMessage), dismissButton: .default(Text("OK")) {
                    self.shouldPopToRootView = false
                })
            }
            
        .sheet(isPresented: $showDocumentPicker) {
            DocumentPicker(uploadItemUrls: $uploadedItemsUrls, selectedButton: $selectedButton, addedAllFiles: $addedAllFiles)
            
        }
            
    }
        .navigationBarTitle(Text("Documents"))
    }
}

