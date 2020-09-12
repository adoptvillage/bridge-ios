//
//  Hoome.swift
//  Created on 11/09/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct Home: View {
    @ObservedObject var homeViewModel = HomeViewModel()
    @State private var fname: String = ""
    @State private var mname: String = ""
    @State private var lname: String = ""
    @State private var username: String = ""
    @State private var interest: String = ""
    @State private var bio: String = ""
    @State private var location: String = ""
    @State private var occupation: String = ""
    @State private var ageselection = 0
   
    var age = [Int](0..<40)
    var body: some View {
        NavigationView {
            
                
                                
            Form{
                
                Section{
                    HStack{
                        Text("First Name").foregroundColor(Color.secondary)
                            .frame(width: 120)
                        Divider()
                    Spacer()
                        
                    TextField("", text: $fname)
                    }
                    
                    HStack{
                        Text("Mid Name").foregroundColor(Color.secondary)
                            .frame(width: 120)
                        Divider()
                    Spacer()
                        
                    TextField("", text: $mname)
                    }
                    
                    HStack{
                        Text("Last Name").foregroundColor(Color.secondary)
                            .frame(width: 120)
                        Divider()
                    Spacer()
                        
                    TextField("", text: $lname)
                    }
                    
                   
                    HStack{
                        Text("Username").foregroundColor(Color.secondary)
                        .frame(width: 120)
                        Divider()
                        Spacer()
                        TextField("", text: $username)
                    }
                    HStack{
                        Text("Is a").foregroundColor(Color.secondary)
                        .frame(width: 120)
                        Divider()
                        Spacer()
                        Text("")
                    }
                    HStack{
                        Text("Interest").foregroundColor(Color.secondary)
                        .frame(width: 120)
                        Divider()
                        Spacer()
                        TextField("", text: $interest)
                    }
                    HStack{
                        Text("Bio").foregroundColor(Color.secondary)
                        .frame(width: 120)
                        Divider()
                        Spacer()
                        TextField("", text: $bio)
                    }
                    HStack{
                        Text("Location").foregroundColor(Color.secondary)
                        .frame(width: 120)
                        Divider()
                        Spacer()
                        TextField("", text: $location)
                        
                    }
                    
                    HStack{
                        Text("Occupation").foregroundColor(Color.secondary)
                        .frame(width: 120)
                        Divider()
                        Spacer()
                        TextField("", text: $occupation)
                    }
                    
                    HStack{
                        Text("Age").foregroundColor(Color.secondary)
                        .frame(width: 120)
                        Divider()
                        Spacer()
                        Picker(selection: self.$ageselection, label: Text("")){
                            ForEach(0 ..< self.age.count){ index in
                                Text("\(self.age[index]) age").tag(index)
                            }
                        }
                        
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


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
