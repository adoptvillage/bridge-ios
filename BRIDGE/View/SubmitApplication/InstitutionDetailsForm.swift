//
//  InstitutionDetailsForm.swift
//  Created on 05/10/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct InstitutionDetailsForm: View {
    @ObservedObject var applicationFormViewModel = SubmitApplicationViewModel()
    @State var name = ""
//    @Binding var isPresented: Bool
    var body: some View {
        Form {
            Section(header: Text("Institute Details")) {
                TextField("Institute Name", text: $applicationFormViewModel.applicationData.instituteName)
                    .padding(10)
                TextField("State", text: $name)
                    .padding(10)
                TextField("District", text: $name)
                    .padding(10)
                TextField("Affiliation Code", text: $name)
                    .padding(10)
            }
            Section(header: Text("Course")) {
                TextField("Year or Semester", text: $name)
                    .padding(10)
                TextField("Course Name", text: $name)
                    .padding(10)
                TextField("Amount Needed", text: $name)
                    .padding(10)
            }
            Section {
                NavigationLink(destination: DocumentUploadForm(applicationFormViewModel: applicationFormViewModel)) {
                    Text("Next")
                }
            }.foregroundColor(Color(.systemIndigo))
            
        }.navigationBarTitle(Text("Course Details"))
    }
}

//struct InstitutionDetailsForm_Previews: PreviewProvider {
//    static var previews: some View {
//        InstitutionDetailsForm()
//    }
//}
