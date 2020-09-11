//
//  Main.swift
//  BRIDGE
//


import Foundation
import SwiftUI

struct main : View{
    
    @State var index = 0
    var logoShown: Bool = true
    
    var body: some View{
        GeometryReader{ geometry in
        VStack{
            
            if self.index==0{
                Image("logo1")
                .resizable()
                .frame(width: 130, height: 130)
            } else {
                Spacer(minLength: geometry.size.height / 8)
            }
            
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
            }.background(Color(.secondarySystemBackground))
            .clipShape(Capsule())
                .padding(.top, 0)
            
            if self.index == 0{
                
                 Login()
                
            }
            else{
                
                SignUP()
                
            }
            
        }.padding(.bottom, 50)
        .padding(.horizontal, 50)
            
            
        }
    }
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .systemIndigo
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.systemIndigo], for: .normal)
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
