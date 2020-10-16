//
//  PersonalInfoForm.swift
//  Created on 05/10/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct PersonalInfoForm: View {
    @Binding var rootIsActive : Bool
    @State var applicationData = SubmitApplicationModel.SubmitData(firstName: "", lastName: "", contactNumber: "", aadhaarNumber: "", state: "", district: "", subDistrict: "", area: "", instituteName: "", instituteState: "", instituteDistrict: "", instituteAffiliationCode: "", courseName: "", yearOrSemester: "", amount: "", offerLetter: "", feeStructure: "", bankStatement: "", instituteType: 0, description: "")
    @ObservedObject var locationSelectorViewModel = LocationSelectorViewModel()
    @ObservedObject var applicationFormViewModel = SubmitApplicationViewModel()
    @State var goToDocumentUpload = false
    @State var showInstituteForm = false
    @State private var selectedtype: Int = 0
    
    private var disableForm: Bool {
        if !applicationData.firstName.isEmpty && !applicationData.lastName.isEmpty &&
            !applicationData.contactNumber.isEmpty && !applicationData.aadhaarNumber.isEmpty &&
            !applicationData.instituteName.isEmpty && !applicationData.instituteState.isEmpty &&
            !applicationData.instituteDistrict.isEmpty && !applicationData.instituteAffiliationCode.isEmpty &&
            !applicationData.yearOrSemester.isEmpty && !applicationData.courseName.isEmpty && !applicationData.amount.isEmpty && !applicationData.description.isEmpty {
            return false
        }
        return true
        }
    
    
    var body: some View {
        VStack{
        Form {
            Section(header: Text("Institute Type")) {
                Picker(selection: self.$selectedtype, label: Text("")) {
                    Text("School").tag(0)
                    Text("University").tag(1)
                    
            }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Personal Details")) {
                
                TextField("First Name", text: $applicationData.firstName)
                    .padding(10)
                    
                TextField("Last Name", text: $applicationData.lastName)
                    .padding(10)
                TextField("Contact No.", text: $applicationData.contactNumber)
                    .padding(10)
                    .keyboardType(.numberPad)       
                TextField("Adhaar No.", text: $applicationData.aadhaarNumber)
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
                TextField("Institute Name", text: $applicationData.instituteName)
                    .padding(10)
                TextField("State", text: $applicationData.instituteState)
                    .padding(10)
                TextField("District", text: $applicationData.instituteDistrict)
                    .padding(10)
                TextField("Affiliation Code", text: $applicationData.instituteAffiliationCode)
                    .padding(10)
            }
            
            Section(header: Text("Course")) {
                TextField(selectedtype == 0 ? "Class" : "Year or Semester", text: $applicationData.yearOrSemester)
                    .padding(10)
                TextField(selectedtype == 0 ? "Section/Stream" :"Course Name", text: $applicationData.courseName)
                    .padding(10)
                TextField("Amount in Rupees", text: $applicationData.amount)
                    .padding(10)
                    .keyboardType(.numberPad)
            }
            
            Section(header: Text("Why you need this money?"), footer: Text("Word limit is 200")) {
                if #available(iOS 14.0, *) {
                    ZStack(alignment: .leading) {
                        if applicationData.description.isEmpty {
                                Text("Notes")
                                    .padding(10)
                                    .foregroundColor(Color(.placeholderText))
                            }
                        TextEditor(text: $applicationData.description)
                    }
                    
                } else {
                    // Fallback on earlier versions
                    TextField("Notes", text: $applicationData.description)
                }
                
            }
            
            Section {
                NavigationLink(destination: DocumentUploadForm(shouldPopToRootView: self.$rootIsActive, applicationFormViewModel: applicationFormViewModel).onAppear(perform: {
                    applicationFormViewModel.setLocation(applicationData: applicationData, locationViewModel: locationSelectorViewModel, isVillageSelected: locationSelectorViewModel.selectedState != 26 ? false : true)
                    applicationFormViewModel.applicationData.instituteType = selectedtype
                }), isActive: $goToDocumentUpload) {

                    Text("Next")
                    
                }
                

            }.foregroundColor(disableForm ? Color(.systemGray) : Color(.systemIndigo))
            .disabled(disableForm)
            
        }.navigationBarTitle(Text("Application Form"))
        
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

