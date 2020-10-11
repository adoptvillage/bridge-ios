//
//  PersonalInfoForm.swift
//  Created on 05/10/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct PersonalInfoForm: View {
    @Binding var rootIsActive : Bool

    @ObservedObject var locationSelectorViewModel = LocationSelectorViewModel()
    @ObservedObject var applicationFormViewModel = SubmitApplicationViewModel()
    @State var goToDocumentUpload = false
    @State var showInstituteForm = false
    
    private var validated: Bool {
        !applicationFormViewModel.applicationData.firstName.isEmpty && !applicationFormViewModel.applicationData.lastName.isEmpty && !applicationFormViewModel.applicationData.contactNumber.isEmpty && applicationFormViewModel.applicationData.aadhaarNumber.isEmpty && !applicationFormViewModel.applicationData.instituteName.isEmpty && !applicationFormViewModel.applicationData.instituteState.isEmpty && !applicationFormViewModel.applicationData.instituteDistrict.isEmpty && !applicationFormViewModel.applicationData.instituteAffiliationCode.isEmpty && !applicationFormViewModel.applicationData.yearOrSemester.isEmpty && !applicationFormViewModel.applicationData.courseName.isEmpty && !applicationFormViewModel.applicationData.amount.isEmpty
        }
    
    var body: some View {
        Form {
            Section(header: Text("Personal Details")) {
                
                TextField("First Name", text: $applicationFormViewModel.applicationData.firstName)
                    .padding(10)
                TextField("Last Name", text: $applicationFormViewModel.applicationData.lastName)
                    .padding(10)
                TextField("Contact No.", text: $applicationFormViewModel.applicationData.contactNumber)
                    .padding(10)
                    .keyboardType(.numberPad)
                TextField("Adhaar No.", text: $applicationFormViewModel.applicationData.aadhaarNumber)
                    .padding(10)
                    .keyboardType(.numberPad)
                
            }.resignKeyboardOnDragGesture()
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
                    .keyboardType(.numberPad)
            }.resignKeyboardOnDragGesture()
            
            Section {
               
                NavigationLink(destination: DocumentUploadForm(shouldPopToRootView: self.$rootIsActive, applicationFormViewModel: applicationFormViewModel).onAppear(perform: {
                    applicationFormViewModel.setLocation(locationViewModel: locationSelectorViewModel, isVillageSelected: locationSelectorViewModel.selectedState != 26 ? false : true)
                }), isActive: $goToDocumentUpload) {
                    if !validated{
                   Text("Next")
                    
                    }
                    
                    
                }
                .isDetailLink(false)

                }.foregroundColor(Color(.systemIndigo))
            
        }.navigationBarTitle(Text("Application Form"))
        
        
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}



