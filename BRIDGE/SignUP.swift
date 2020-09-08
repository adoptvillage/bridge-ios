//
//  SignUP.swift
//  BRIDGE
//


import Foundation
import SwiftUI

struct SignUP : View {
    
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    @State var visible = false
    @State var visible1 = false
    
    var body : some View{
        
       VStack{
           
           VStack{
                       
                       HStack(spacing: 15){
                           
                           Image(systemName: "envelope")
                               .foregroundColor(Color(.systemIndigo))
                           
                           TextField("Enter Email Address", text: self.$email)
                           
                       }.padding(15)
                       .background(Capsule().fill(Color.white))
                       .padding(.vertical, 15)
                       
                     //  Divider()
                       
                       HStack(spacing: 15){
                           
                           Image(systemName: "lock")
                           .resizable()
                           .frame(width: 15, height: 18)
                               .foregroundColor(Color(.systemIndigo))
                        
                        if self.visible{
                            TextField("Password", text: self.$pass)
                                .autocapitalization(.none)
                        }
                        else{
                           
                           SecureField("Password", text: self.$pass)
                        }
                        
                           Button(action: {
                            self.visible.toggle()
                           }) {
                               
                            Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                   .foregroundColor(Color(.systemIndigo))
                           }
                           
                       }.padding(15)
                       .background(Capsule().fill(Color.white))
                       .padding(.vertical, 15)
            
                    //   Divider()
            
                       HStack(spacing: 15){
                           
                           Image(systemName: "lock")
                           .resizable()
                           .frame(width: 15, height: 18)
                               .foregroundColor(Color(.systemIndigo))
                        
                        if self.visible1{
                            TextField("Re-Enter", text: self.$repass)
                                .autocapitalization(.none)
                        }
                        else{
                           
                           SecureField("Re-Enter", text: self.$repass)
                        }
                           Button(action: {
                            self.visible1.toggle()
                           }) {
                               
                            Image(systemName: self.visible1 ? "eye.slash.fill" : "eye.fill")
                                   .foregroundColor(Color(.systemIndigo))
                           }
                           
                       }.padding(15)
                       .background(Capsule().fill(Color.white))
                       .padding(.vertical, 15)
            
                       
           
               }
                   .padding(.vertical)
                   .padding(.horizontal, 20)
                   .padding(.bottom, 40)
           .background(Color.black.opacity(0.1))
                   .cornerRadius(30)
                   .padding(.top, 25)
           
           Button(action: {
               
           }) {
               
               Text("SIGNUP")
                   .foregroundColor(.white)
                   .fontWeight(.heavy)
                   .padding(.vertical)
                   .frame(width: (UIScreen.main.bounds.width - 200))
               
               
           }.background(Color(.systemIndigo))
           .cornerRadius(30)
               .offset(y: -40)
               .padding(.bottom, -40)
           
       }
            
            
    }
}

