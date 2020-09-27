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
                HStack(spacing:15){
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("Application No. :- ")
                            .fontWeight(.bold)
                            .font(.system(size: 21))
                            .foregroundColor(.white)
                            .padding(.top)
                            .padding(.bottom, 5)
                        HStack(spacing : 10){
                           
                            VStack(alignment: .leading, spacing: 10){
                                HStack(spacing: 10){
                                    Text("Donor :- ")
                                        .frame(width: 120)
                                    Divider()
                                    
                                    Text("Vatsal")
                                        .foregroundColor(.red)
                                        .padding(.leading, 50)
                                }
                                Divider()
                                
                                HStack(spacing: 10){
                                    Text("Recipient :- ")
                                        .frame(width: 120)
                                    Divider()
                                    Text("Vatsal")
                                        .foregroundColor(.green)
                                        .padding(.leading, 50)
                                }
                                Divider()
                                
                                HStack(spacing: 10){
                                    Text("Amount :- ")
                                        .frame(width: 120)
                                    Divider()
                                    Text("$400")
                                        .foregroundColor(.yellow)
                                        .padding(.leading, 50)
                                }
                                HStack{
                                    VStack{
                                    Capsule()
                                        .fill(Color.green)
                                        .frame(width: UIScreen.main.bounds.width/4, height: 5)
                                        
                                    Text("Application filled")
                                        .foregroundColor(.white)
                                        .fontWeight(.thin)
                                        .font(.system(size: 10))
                                        .frame(width: UIScreen.main.bounds.width/4, height: 20)
                                        
                                        
                                    }
                                    VStack{
                                    Capsule()
                                        .fill(Color.green)
                                        .frame(width: UIScreen.main.bounds.width/4, height: 5)
                                    
                                        Text("Being Reviewed")
                                            .foregroundColor(.white)
                                            .fontWeight(.thin)
                                            .font(.system(size: 10))
                                            .frame(width: UIScreen.main.bounds.width/4, height: 20)
                                    }
                                    VStack{
                                    Capsule()
                                        .fill(Color.gray)
                                        .frame(width: UIScreen.main.bounds.width/4, height: 5)
                                        
                                        Text("Accepted")
                                            .foregroundColor(.white)
                                            .fontWeight(.thin)
                                            .font(.system(size: 10))
                                            .frame(width: UIScreen.main.bounds.width/4, height: 20)
                                    }
                                    
                                }.frame(alignment: .center)
                                .padding(.vertical)
                          
                                }
                        }
                        }
                    .padding(.all)
                    .frame(width: UIScreen.main.bounds.width - 40)
                    .frame(height : UIScreen.main.bounds.height / 3.2)
                    .background(Color(.systemIndigo).opacity(0.8))
                    .cornerRadius(20)
                
                   
              
               
                }.padding(.bottom)
                HStack(){
                    VStack{
                        Text("Succesfull Applications")
                            .fontWeight(.bold)
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                            .frame(height: 40)
                            .padding(.top, 15)
                        Divider()
                        Text("23")
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemIndigo))
                            .font(.system(size: 35))
                            .padding(.bottom, 15)
                            
                    }.padding(.all)
                    .frame(width: UIScreen.main.bounds.width/2.4)
                    .frame(height : UIScreen.main.bounds.height / 5.5)
                    .background(Color(.systemGray4))
                    .cornerRadius(20)
                    .padding(.trailing, 10)
                    
                    VStack{
                        Text("Amounted Donated")
                            .fontWeight(.bold)
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                            .frame(height: 40)
                        Divider()
                        Text("$400")
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemIndigo))
                            .font(.system(size: 35))
                            
                    }.padding()
                    .frame(width: UIScreen.main.bounds.width/2.4)
                    .frame(height : UIScreen.main.bounds.height / 5.5)
                    .background(Color(.systemGray4))
                    .cornerRadius(20)
                }.padding(.bottom, 20)
                
                HStack(){
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("History")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                    }.padding()
                    .frame(width: UIScreen.main.bounds.width/2.5)
                    .frame(height : UIScreen.main.bounds.height / 15)
                    .background(Color(.systemIndigo))
                    .cornerRadius(15)
                    .padding(.trailing, 10)
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("Preferred Location")
                            .font(.system(size: 17))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(height: 50)
                            
                        
                    }.padding()
                    .frame(width: UIScreen.main.bounds.width/2.5)
                    .frame(height : UIScreen.main.bounds.height / 15)
                    .background(Color(.systemIndigo))
                    .cornerRadius(15)
                }
                
                
            }.padding(.all)
                    .padding(.trailing, 25)
            .navigationBarTitle("Welcome User!")
            .navigationBarItems(trailing: Button(action: {
                
            }){
                Text("Apply")
            }
            )
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




