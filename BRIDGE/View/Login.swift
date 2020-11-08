//
//  Login.swift
//  BRIDGE
//


import Foundation
import SwiftUI



struct Login : View {
    
    @State var email = ""
    @State var password = ""
    @State var visible = false
    @State var alertMessage = ""
    @State var showAlert = false
    @ObservedObject var loginViewModel = LoginViewModel()
    
    var body : some View{
        
        VStack{
            
            VStack{
                
                HStack(spacing: 15){
                    
                    Image(systemName: "envelope")
                        .foregroundColor(Color(.systemIndigo))
                    
                    TextField("Email Address", text: self.$email)
                        .autocapitalization(.none)
                    
                    
                }.padding(15)
                    .background(Capsule().fill(Color(.tertiarySystemBackground)))
                    .padding(.vertical, 10)
                
                //Divider()
                
                HStack(spacing: 15){
                    
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 15, height: 18)
                        .foregroundColor(Color(.systemIndigo))
                    if self.visible{
                        TextField("Password", text: self.$password)
                            .autocapitalization(.none)
                    }
                    else{
                        SecureField("Password", text: self.$password)
                            .autocapitalization(.none)
                    }
                    
                    Button(action: {
                        self.visible.toggle()
                    }) {
                        
                        Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                        
                    } .foregroundColor(Color(.systemIndigo))
                    
                    
                }.padding(15)
                    .background(Capsule().fill(Color(.tertiarySystemBackground)))
                    .padding(.vertical, 10)
                
                HStack{
                    Spacer(minLength: 0)
                    Text("Forgot Password?")
                        .foregroundColor(Color(.systemGray))
                }.padding(.trailing, 10)
                    .padding(.vertical, 0)
                
                
                
            }
            .padding(.vertical)
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(30)
            .padding(.top, 25)
            
            Button(action: {
                self.loginViewModel.loginUser(email: self.email, password: self.password) { (errorMessage) in
                    if errorMessage != "" {
                        self.showAlert = true
                        self.alertMessage = errorMessage
                    }
                }
                
            }) {
                if self.loginViewModel.inActivity {
                    ActivityIndicator(isAnimating: self.$loginViewModel.inActivity)
                        .foregroundColor(.white)
                        .frame(width: (UIScreen.main.bounds.width - 200), height: 50)
                } else {
                    Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .padding(.vertical)
                    .frame(width: (UIScreen.main.bounds.width - 200))
                }
                
                
                
            }.background(self.email.isEmpty ||
                self.password.isEmpty ? Color(.gray) : Color(.systemIndigo))
                .cornerRadius(30)
                .offset(y: -40)
                .padding(.bottom, -40)
                .disabled(self.email.isEmpty ||
                    self.password.isEmpty ? true : false)
            .alert(isPresented: self.$showAlert) {
                Alert(title: Text(self.alertMessage))
            }
            
        }
        
        
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
