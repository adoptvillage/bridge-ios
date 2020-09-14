//
//  Hoome.swift
//  Created on 11/09/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct Home: View {
    @ObservedObject var homeViewModel = HomeViewModel()
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var address: String = ""
   
    @State private var location: String = ""
    @State private var occupation: String = ""
    @State private var role: String = ""
    
   
    
    var body: some View {
        NavigationView {
            
            
            
            VStack{
                
               
                                
            Form{
                
                 
                
                Section{
                    CircleImage()
                        .offset(x: UIScreen.main.bounds.width/3.5)
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
                 self.homeViewModel.logout()
                }) {
                 Text("Logout")
                     .foregroundColor(Color(.systemIndigo))
                 .fontWeight(.heavy)
                 .padding(.vertical)
                    
                 //.frame(width: (UIScreen.main.bounds.width - 200))
            }
            .navigationBarTitle("Profile")
            .navigationBarItems(trailing: EditButton())
            
            
           
           
           }
            
            }
        
        }
    }
    }




struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
