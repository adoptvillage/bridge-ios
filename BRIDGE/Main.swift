//
//  Main.swift
//  BRIDGE
//
//  Created by Abhi Kulshrestha on 28/08/20.
//  Copyright © 2020 Abhi Kulshrestha. All rights reserved.
//

import Foundation
import SwiftUI

struct main : View{
    
    @State var index = 0
    @State private var selectedColor = 0
    
    var body: some View{
        GeometryReader{_ in
        VStack{
            Image("logo1")
            .resizable()
            .frame(width: 130, height: 130)
            
            HStack{
                Button(action: {
                    
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)){
                         self.index = 0
                    }
                    
                   
                    
                }) {
                    
                    Text("LOGIN")
                        .foregroundColor(self.index == 0 ? .white : Color(.systemIndigo))
                        .fontWeight(.heavy)
                        .padding(.vertical, 12)
                        .frame(width: (UIScreen.main.bounds.width - 80) / 2)
                }.background(self.index == 0 ? Color(.systemIndigo) : Color.clear)
                .clipShape(Capsule())
                
                Button(action: {
                    
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)){
                         self.index = 1
                    }
                    
                    
                }) {
                    
                    Text("SIGNUP")
                        .foregroundColor(self.index == 1 ? .white : Color(.systemIndigo))
                        .fontWeight(.heavy)
                        .padding(.vertical, 12)
                        .frame(width: (UIScreen.main.bounds.width - 80) / 2)
                }.background(self.index == 1 ? Color(.systemIndigo) : Color.clear)
                .clipShape(Capsule())
            }.background(Color.black.opacity(0.1))
            .clipShape(Capsule())
                .padding(.top, 0)
            
            if self.index == 0{
                
                 Login()
                
            }
            else{
                
                SignUP()
                
            }
            
            
           VStack {
              
               Picker(selection: self.$selectedColor, label: Text("")) {
                   Text("DONOR").tag(1)
                   Text("RECIPIENT").tag(2)
                   Text("UNIVERSITY").tag(3)
               }
               .labelsHidden()
               .pickerStyle(SegmentedPickerStyle())
               
           }.padding(.top, 30)
            
        }.padding(.bottom, 100)
        .padding(.horizontal, 50)
            
            
        }
    }
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .systemIndigo
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.systemIndigo], for: .normal)
    }
}
