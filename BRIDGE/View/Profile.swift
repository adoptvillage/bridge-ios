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
                        }
                        
                        HStack{
                            Text("Email").foregroundColor(Color.secondary)
                                .frame(width: 120)
                            Divider()
                            Spacer()
                            TextField("", text: $email)
                        }
                        
                        HStack{
                            Text("Address").foregroundColor(Color.secondary)
                                .frame(width: 120)
                            Divider()
                            Spacer()
                            TextField("", text: $address)
                        }
                        
                        HStack{
                            Text("Location").foregroundColor(Color.secondary)
                                .frame(width: 120)
                            Divider()
                            Spacer()
                            TextField("", text: $location)
                        }
                        
                        HStack{
                            Text("Role").foregroundColor(Color.secondary)
                                .frame(width: 120)
                            Divider()
                            Spacer()
                            TextField("", text: $role)
                        }
                        
                        HStack{
                            Text("Occupation").foregroundColor(Color.secondary)
                                .frame(width: 120)
                            Divider()
                            Spacer()
                            TextField("", text: $occupation)
                        }
                        
                    }.padding(.vertical, 8)
                    
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
            .navigationBarTitle("Profile")
            .navigationBarItems(trailing: EditButton())
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
