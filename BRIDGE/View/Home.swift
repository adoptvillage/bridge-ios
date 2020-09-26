//
//  Hoome.swift
//  Created on 11/09/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI
import SwiftUICharts

struct Home: View {
    
    var colors = [Color(.white), Color(.white)]
    var body: some View {
        NavigationView {
            GeometryReader{ geometry in
                ScrollView{
            VStack{
                
                BarCharts().padding(.top)
              
                VStack(alignment: .center, spacing: 0){
                    HStack{
                        Text("Money Donated")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Text(" $ 82378")
                            .fontWeight(.heavy)
                            .font(.system(size: 28))
                            .foregroundColor(.green)
                    }.padding()
                    .frame(width: UIScreen.main.bounds.width - 50)
                    .frame(height : UIScreen.main.bounds.height / 15)
                    .background(Color(.systemGray4))
                    .cornerRadius(15)
                    
                }.padding(.top)
                .padding(.bottom)
                HStack{
               PieCharts()
                    VStack{
                        HStack{
                            VStack{
                                HStack{
                            Button(action: {
                                
                            }) {
                                
                                Text("History")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                            }.padding()
                            .frame(width: UIScreen.main.bounds.width/2.5)
                            .frame(height : UIScreen.main.bounds.height / 15)
                            .background(Color(.red))
                            .cornerRadius(15)
                                }
                                HStack{
                            Button(action: {
                                
                            }) {
                                
                                Text("Status")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                            }.padding()
                            .frame(width: UIScreen.main.bounds.width/2.5)
                            .frame(height : UIScreen.main.bounds.height / 15)
                            .background(Color(.green))
                            .cornerRadius(15)
                                }.padding(.top)
                            
                            HStack{
                            Button(action: {
                                
                            }) {
                                
                                Text("Apply")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                            }.padding()
                            .frame(width: UIScreen.main.bounds.width/2.5)
                            .frame(height : UIScreen.main.bounds.height / 15)
                            .background(Color(.systemIndigo))
                            .cornerRadius(15)
                            }.padding(.top)
                            }.padding(.leading)
                        }
                    }
                }
            }.padding(.leading, 25)
            .navigationBarTitle("Welcome User!")
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




