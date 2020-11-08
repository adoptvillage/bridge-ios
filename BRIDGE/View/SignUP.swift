//
//  SignUP.swift
//  BRIDGE
//


import Foundation
import SwiftUI

struct SignUP : View {
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var otp = ""
    @State var passwordVisible = false
    @State var confirmPasswordVisible = false
    
    @State private var selectedRole: Int = -1
    @State var inActivity: Bool = false
    @ObservedObject var signUpViewModel = SignUpViewModel()
    @State var signUpDisabled: Bool = true
    @State var showAlert = false
    @State var alertMessage = ""
    
    
    
    var body : some View{
        GeometryReader() { geometry in
            ScrollView {
                VStack{
                    VStack {
                        Picker(selection: self.$selectedRole, label: Text("")) {
                            Text("DONOR").tag(0)
                            Text("RECIPIENT").tag(1)
                            Text("MODERATOR").tag(2)
                        }.padding(.top, 20)
                        .labelsHidden()
                        .pickerStyle(SegmentedPickerStyle())
                        Text("Select a role")
                            .foregroundColor(Color(.systemGray))
                    }
                    
                    ScrollView{
                        
                        HStack(spacing: 15){
                            
                            Image(systemName: "person")
                                .foregroundColor(Color(.systemIndigo))
                            
                            TextField("Name", text: self.$name)
                            
                        }.padding(15)
                        .background(Capsule().fill(Color(.tertiarySystemBackground)))
                        .padding(.vertical, 10)
                        
                        //  Divider()
                        
                        HStack(spacing: 15){
                            
                            Image(systemName: "envelope")
                                .foregroundColor(Color(.systemIndigo))
                            
                            TextField("Email Address", text: self.$email)
                                .autocapitalization(.none)
                            
                            
                        }.padding(15)
                        .background(Capsule().fill(Color(.tertiarySystemBackground)))
                        .padding(.vertical, 10)
                        
                        //   Divider()
                        
                        HStack(spacing: 15){
                            
                            Image(systemName: "lock")
                                .resizable()
                                .frame(width: 15, height: 18)
                                .foregroundColor(Color(.systemIndigo))
                            
                            if self.passwordVisible{
                                TextField("Enter Password", text: self.$password)
                                    .autocapitalization(.none)
                            }
                            else{
                                
                                SecureField("Enter Password", text: self.$password)
                            }
                            Button(action: {
                                self.passwordVisible.toggle()
                            }) {
                                
                                Image(systemName: self.passwordVisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(Color(.systemIndigo))
                            }
                            
                        }.padding(15)
                        .background(Capsule().fill(Color(.tertiarySystemBackground)))
                        .padding(.vertical, 10)
                        
                        
                        HStack(spacing: 15){
                            
                            Image(systemName: "lock")
                                .resizable()
                                .frame(width: 15, height: 18)
                                .foregroundColor(Color(.systemIndigo))
                            
                            if self.confirmPasswordVisible{
                                TextField("Re-Enter Password", text: self.$confirmPassword)
                                    .autocapitalization(.none)
                            }
                            else{
                                
                                SecureField("Confirm Password", text: self.$confirmPassword)
                            }
                            Button(action: {
                                self.confirmPasswordVisible.toggle()
                            }) {
                                
                                Image(systemName: self.confirmPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(Color(.systemIndigo))
                            }
                            
                        }.padding(15)
                        .background(Capsule().fill(Color(.tertiarySystemBackground)))
                        .padding(.vertical, 10)
                        
                        if selectedRole == 2 {
                            HStack(spacing: 15){
                                
                                Image(systemName: "number.square")
                                    .foregroundColor(Color(.systemIndigo))
                                
                                TextField("Unique Invite Code", text: self.$otp)
                                
                            }.padding(15)
                            .background(Capsule().fill(Color(.tertiarySystemBackground)))
                            .padding(.vertical, 10)
                        }
                        
                        
                        
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(30)
                    .padding(.top, 30)
                    //            .frame(width: geometry.size.width - 20, height: geometry.size.height - 20)
                    
                    
                    Button(action: {
                        print(self.selectedRole)
                        let signUpData = SignUpModel.SignUpRequestData(name: self.name, email: self.email, password: self.password, role: self.selectedRole, otp: self.otp)
                        self.signUpViewModel.registerUser(roleSelection: self.selectedRole, signUpData: signUpData, confirmPassword: self.confirmPassword) { (response) in
                            self.alertMessage = response.message
                            self.showAlert = true
                            print(response.message)
                        }
                        
                        
                    }) {
                        if self.signUpViewModel.inActivity {
                            ActivityIndicator(isAnimating: self.$signUpViewModel.inActivity)
                                .foregroundColor(.white)
                                .frame(width: (UIScreen.main.bounds.width - 200), height: 50)
                        } else {
                            Text("SIGNUP")
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                                .padding(.vertical)
                                .frame(width: (UIScreen.main.bounds.width - 200))
                        }
                        
                        
                        
                    }.alert(isPresented: self.$showAlert) {
                        Alert(title: Text(self.alertMessage))
                    }
                    .background(self.name == "" ||
                                    self.email.isEmpty ||
                                    self.password.isEmpty ||
                                    self.confirmPassword.isEmpty ||
                                    self.selectedRole == -1 ? Color(.gray) : Color(.systemIndigo))
                    .cornerRadius(30)
                    .offset(y: -40)
                    .padding(.bottom, -40)
                    .disabled(self.name == "" ||
                                self.email.isEmpty ||
                                self.password.isEmpty ||
                                self.confirmPassword.isEmpty ||
                                self.selectedRole == -1 ? true : false)
                    
                    
                    
                }
                .padding(.bottom, 50)
            }
        }
    }
}


struct SignUP_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
