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
    @ObservedObject var locationSelectorViewModel = LocationSelectorViewModel()
    
    func fetchProfile() {
        
        profileViewModel.getProfile { (profile)  in
            self.name = profile.name ?? ""
            self.email = profile.email ?? ""
            self.role = profile.isDonor ? "Donor" : profile.isRecipient ? "Recipient" : profile.isModerator ? "Moderator" : ""
            self.address = profile.address ?? ""
            self.location = profile.location ?? ""
            self.occupation = profile.occupation ?? ""
            
        }
    }
    
    var body: some View {
        NavigationView {
            
            VStack{
                
                Form{
                    
                    Section{
                        HStack(alignment: .center) {
                            Spacer()
                            CircleImage()
                            Spacer()
                            
                        }
                        
                        HStack{
                            Text("Name").foregroundColor(Color.secondary)
                                .frame(width: 120)
                            Divider()
                            Spacer()
                            
                            TextField("", text: $name)
                                .disabled(!self.isProfileEditing)
                        }
                        
                        HStack{
                            Text("Email").foregroundColor(Color.secondary)
                                .frame(width: 120)
                            Divider()
                            Spacer()
                            TextField("", text: $email)
                                .disabled(true)
                        }.foregroundColor(self.isProfileEditing ? Color(.systemGray) : Color.primary)
                        
                        HStack{
                            Text("Address").foregroundColor(Color.secondary)
                                .frame(width: 120)
                            Divider()
                            Spacer()
                            TextField("", text: $address)
                                .disabled(!self.isProfileEditing)
                        }
                        
                        HStack{
                            Text("Location").foregroundColor(Color.secondary)
                                .frame(width: 120)
                            Divider()
                            Spacer()
                            TextField("", text: $location)
                                .disabled(!self.isProfileEditing)
                        }
                        
                        HStack{
                            Text("Role").foregroundColor(Color.secondary)
                                .frame(width: 120)
                            Divider()
                            Spacer()
                            TextField("", text: $role)
                                .disabled(true)
                        }.foregroundColor(self.isProfileEditing ? Color(.systemGray) : Color.primary)
                        
                        HStack{
                            Text("Occupation").foregroundColor(Color.secondary)
                                .frame(width: 120)
                            Divider()
                            Spacer()
                            TextField("", text: $occupation)
                                .disabled(!self.isProfileEditing)
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
                        self.alertMessage = responseMessage
                        self.showAlert.toggle()
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
