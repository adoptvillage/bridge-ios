//
//  PersonalInfoForm.swift
//  Created on 05/10/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct PersonalInfoForm: View {
    @ObservedObject var locationSelectorViewModel = LocationSelectorViewModel()
    @ObservedObject var applicationFormViewModel = SubmitApplicationViewModel()
    @State var goToDocumentUpload = false
    @State var showInstituteForm = false
    
    var body: some View {
        Form {
            Section(header: Text("Personal Details")) {
                
                TextField("First Name", text: $applicationFormViewModel.applicationData.firstName)
                    .padding(10)
                TextField("Last Name", text: $applicationFormViewModel.applicationData.lastName)
                    .padding(10)
                TextField("Contact No.", text: $applicationFormViewModel.applicationData.contactNumber)
                    .padding(10)
                TextField("Adhaar No.", text: $applicationFormViewModel.applicationData.aadhaarNumber)
                    .padding(10)
                
            }
            Section {
                
                Picker(selection: $locationSelectorViewModel.selectedState, label: Text("State")) {
                    ForEach(0 ..< locationSelectorViewModel.stateNames.count) { index in
                        Text(locationSelectorViewModel.stateNames[index])
                    }
                }
                
                if locationSelectorViewModel.selectedState == 26 {
                    Picker(selection: $locationSelectorViewModel.selectedDistrict, label: Text("District")) {
                        ForEach(0 ..< locationSelectorViewModel.districtNamesCount) { index in
                            Text(locationSelectorViewModel.districtNames[index])
                        }
                    }.id(locationSelectorViewModel.id)
                    Picker(selection: $locationSelectorViewModel.selectedSubDistrict, label: Text("SubDistrict")) {
                        ForEach(0 ..< locationSelectorViewModel.subDistrictNames.count){index in
                            Text(locationSelectorViewModel.subDistrictNames[index])
                        }
                    }.id(locationSelectorViewModel.id)
                    Picker(selection: $locationSelectorViewModel.selectedArea, label: Text("Area")) {
                        ForEach(0 ..< locationSelectorViewModel.areaNames.count){ index in
                            Text(locationSelectorViewModel.areaNames[index])
                        }
                    }.id(locationSelectorViewModel.id)
                } else {
                    Picker(selection: $locationSelectorViewModel.selectedDistrict, label: Text("District")) {
                        ForEach(0 ..< locationSelectorViewModel.districtNamesCount) { index in
                            Text(locationSelectorViewModel.districtNames[index])
                        }
                    }.id(locationSelectorViewModel.id)
                }
            }
            
            Section(header: Text("Institute Details")) {
                TextField("Institute Name", text: $applicationFormViewModel.applicationData.instituteName)
                    .padding(10)
                TextField("State", text: $applicationFormViewModel.applicationData.instituteState)
                    .padding(10)
                TextField("District", text: $applicationFormViewModel.applicationData.instituteDistrict)
                    .padding(10)
                TextField("Affiliation Code", text: $applicationFormViewModel.applicationData.instituteAffiliationCode)
                    .padding(10)
            }
            Section(header: Text("Course")) {
                TextField("Year or Semester", text: $applicationFormViewModel.applicationData.yearOrSemester)
                    .padding(10)
                TextField("Course Name", text: $applicationFormViewModel.applicationData.courseName)
                    .padding(10)
                TextField("Amount in Rupees", text: $applicationFormViewModel.applicationData.amount)
                    .padding(10)
            }
            
            Section {
                
                Button(action: {
                    applicationFormViewModel.setLocation(locationViewModel: locationSelectorViewModel, isVillageSelected: locationSelectorViewModel.selectedState != 26 ? false : true)
                    goToDocumentUpload = true
                }) {
                    NavigationLink(destination: DocumentUploadForm(applicationFormViewModel: applicationFormViewModel), isActive: $goToDocumentUpload) {
                        Text("Next")
                    }
                }
//                NavigationLink(destination: DocumentUploadForm(applicationFormViewModel: applicationFormViewModel)) {
//                    Text("Next")
//                }

            }.foregroundColor(Color(.systemIndigo))
            
        }.navigationBarTitle(Text("Application Form"))
        
    }
}

struct SubmitApplication_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoForm()
    }
}
