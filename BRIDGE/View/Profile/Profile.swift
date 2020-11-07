//
//  Profile.swift
//  Created on 15/09/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct Profile: View {
    @ObservedObject var profileViewModel = ProfileViewModel()
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var address: String = ""
    
    @State private var location: String = ""
    @State private var occupation: String = ""
    @State private var role: String = ""
    
    @State private var isProfileEditing: Bool = false
    @State var showAlert = false
    @State var alertMessage = ""
    @State var preferredLocation = ""
    @ObservedObject var locationSelectorViewModel = LocationSelectorViewModel()
    
    func fetchProfile() {
        
        profileViewModel.getProfile { (profile)  in
            self.name = profile.name ?? ""
            self.email = profile.email ?? ""
            self.role = profile.isDonor ? "Donor" : profile.isRecipient ? "Recipient" : profile.isModerator ? "Moderator" : ""
            self.address = profile.address ?? ""
            self.location = profile.location ?? ""
            self.occupation = profile.occupation ?? ""
            if profile.isDonor {
                profileViewModel.getPreferredLocation { (location) in
                    if location.area == "" && location.subDistrict == ""{
                        self.preferredLocation = "\(location.district), \(location.state)"
                    } else {
                        self.preferredLocation = "\(location.area), \(location.subDistrict), \(location.district), \(location.state)"
                    }
                    
                }
            }
            
        }
    }
    
    var body: some View {
        NavigationView {
            
            VStack{
                
                Form{
                    
                    Section{
                        if profileViewModel.inActivity {
                            HStack(alignment: .center) {
                                Spacer()
                                ActivityIndicator(isAnimating: $profileViewModel.inActivity)
                                Spacer()
                            }
                            
                        }
                        HStack(alignment: .center) {
                            Spacer()
                            CircleImage()
                            Spacer()
                            
                        }
                        
                        HStack{
                            Text("Name").foregroundColor(Color.secondary)
                                .frame(width: 120)
                            Divider()
                            if isProfileEditing {
                                TextField("", text: $name)
                                    .disabled(!self.isProfileEditing)
                            } else{
                                Text(name)
                                Spacer()
                            }
                            
                        }
                        
                        HStack{
                            Text("Email").foregroundColor(Color.secondary)
                                .frame(width: 120)
                            Divider()
                            if isProfileEditing {
                                TextField("", text: $email)
                                    .disabled(true)
                            } else{
                                Text(email)
                                Spacer()
                            }
                            
                        }.foregroundColor(self.isProfileEditing ? Color(.systemGray) : Color.primary)
                        
                        HStack{
                            Text("Address").foregroundColor(Color.secondary)
                                .frame(width: 120)
                            Divider()
                            if isProfileEditing {
                                TextField("", text: $address)
                                    .disabled(!self.isProfileEditing)
                            } else{
                                Text(address)
                                Spacer()
                            }
                            
                        }
                        
                        HStack{
                            Text("Location").foregroundColor(Color.secondary)
                                .frame(width: 120)
                            Divider()
                            Spacer()
                            if isProfileEditing {
                                TextField("", text: $location)
                                    .disabled(!self.isProfileEditing)
                            } else{
                                Text(location)
                                Spacer()
                            }
                            
                        }
                        
                        HStack{
                            Text("Role").foregroundColor(Color.secondary)
                                .frame(width: 120)
                            Divider()
                            if isProfileEditing {
                                TextField("", text: $role)
                                    .disabled(true)
                            } else{
                                Text(role)
                                Spacer()
                            }
                            
                        }.foregroundColor(self.isProfileEditing ? Color(.systemGray) : Color.primary)
                        
                        HStack{
                            Text("Occupation").foregroundColor(Color.secondary)
                                .frame(width: 120)
                            Divider()
                            if isProfileEditing {
                                TextField("", text: $occupation)
                                    .disabled(!self.isProfileEditing)
                            } else{
                                Text(occupation)
                                Spacer()
                            }
                            
                        }
                        if role == "Donor" {
                            HStack{
                                Text("Preferred Location").foregroundColor(Color.secondary)
                                    .frame(width: 120)
                                Divider()
                                Text(preferredLocation)
                                Spacer()
                            }
                        }
                        
                        
                    }.padding(.vertical, 8)
                    
                    if self.isProfileEditing {
                        
                        Section(header: Text("Preferred Location")) {
                             
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
                     }
                    
                    if !self.isProfileEditing {
                        Button(action: {
                            self.profileViewModel.logout()
                        }) {
                            Text("Logout")
                                .foregroundColor(Color(.systemIndigo))
                                .fontWeight(.heavy)
                                .padding(.vertical)
                            
                        }
                    }
                }
                
            }
            .navigationBarTitle("Profile")
            .navigationBarItems(leading: Button(self.isProfileEditing ? "Cancel" : "") {
                self.isProfileEditing = false
            },
                
                trailing: Button(self.isProfileEditing ? "Done" : "Edit") {
                if self.isProfileEditing {
                    profileViewModel.updateProfile(profileUpdateData: ProfileModel.ProfileUpdateData(name: name, address: address, location: location, occupation: occupation)) { (responseMessage) in
                        if role == "Donor" {
                            
                            profileViewModel.updatePreferredLocation(preferredLocationUploadData: PreferredLocationModel.LocationResponse(state: locationSelectorViewModel.stateNames[locationSelectorViewModel.selectedState], district: locationSelectorViewModel.selectedState == 26 ? locationSelectorViewModel.villageData[locationSelectorViewModel.selectedDistrict].district : locationSelectorViewModel.districtNames[locationSelectorViewModel.selectedDistrict], subDistrict: locationSelectorViewModel.selectedState != 26 ? "" :  locationSelectorViewModel.subDistrictNames[locationSelectorViewModel.selectedSubDistrict], area: locationSelectorViewModel.selectedState != 26 ? "" :  locationSelectorViewModel.areaNames[locationSelectorViewModel.selectedArea])) { (msg) in
                                print(msg)
                                self.alertMessage = responseMessage
                                self.showAlert.toggle()
                                
                            }
                        } else {
                            self.alertMessage = responseMessage
                            self.showAlert.toggle()
                        }
                        
                        
                    }
                    print("profile edited")
                }
                self.isProfileEditing.toggle()
//                self.showProfileEditor.toggle()
            }).alert(isPresented: self.$showAlert) {
                Alert(title: Text(self.alertMessage))
            }
            
        }.onAppear {
            self.fetchProfile()
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
