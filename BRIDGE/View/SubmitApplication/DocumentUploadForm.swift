//
//  DocumentUploadForm.swift
//  Created on 05/10/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct DocumentUploadForm: View {
    var applicationFormViewModel: SubmitApplicationViewModel!
    @State var showDocumentPicker = false
    @State var showAlert = false
//    @Binding var isPresented: Bool
    var body: some View {
        Form {
            Section(header: Text("Upload Documents")) {
                Button(action: {
                    self.showDocumentPicker.toggle()
                }) {
                    Text("Document")
                }
            }
            Section {
                Button(action: {
                    print(applicationFormViewModel.applicationData.state)
                    print(applicationFormViewModel.applicationData.district)
                    print(applicationFormViewModel.applicationData.subDistrict)
                    print(applicationFormViewModel.applicationData.area)
                }) {
                    Text("Submit")
                }
            }.foregroundColor(Color(.systemIndigo))
            
        }.navigationBarTitle(Text("Documents"))
        .sheet(isPresented: $showDocumentPicker) {
            DocumentPicker(alert: $showAlert)
                
        }.alert(isPresented: $showAlert) {
            Alert(title: Text("Success!"), message: Text("Document uploaded"), dismissButton: .default(Text("OK")))
        }
    }
}

//struct DocumentUploadForm_Previews: PreviewProvider {
//    static var previews: some View {
//        DocumentUploadForm()
//    }
//}
