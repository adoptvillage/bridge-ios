//
//  Home.swift
//  Created on 11/09/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct Home: View {
    @State var isActive : Bool = false
    @State var showLocationSelector = false
    @State var showApplicationSubmitView = false
    @State var index = 0
    var body: some View {
        NavigationView {
            GeometryReader{ geometry in
                
                ScrollView{
                    
                    VStack{
                        
                        if #available(iOS 14.0, *) {
                            TabView(selection: self.$index){
                               
                                    
                                    ForEach(1..<5){ i in
                                        CardView()
                                    }
                                    
                                    
                                    
                               
                            }.frame(height : UIScreen.main.bounds.height/3)
                            .tabViewStyle(PageTabViewStyle())
                            .animation(.easeOut)
                        } else {
                            // Fallback on earlier versions
                            ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing:20){
                                ForEach(1..<5){ i in
                                    CardView()
                                }
                            }.padding(.bottom)
                        }

                        }
                        HStack(){
                            VStack{
                                Text("Succesfull Applications")
                                    .font(.system(size: 15))
                                    .frame(height: 40)
                                Divider()
                                Text("23")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.systemIndigo))
                                    .font(.system(size: 25))
                                
                            }.padding(.all)
                            .frame(width: UIScreen.main.bounds.width/2.4)
                            .frame(height : UIScreen.main.bounds.height / 5.5)
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(20)
                            .padding(.trailing, 10)
                            
                            VStack{
                                Text("Amounted Donated")
                                    .font(.system(size: 15))
                                    .frame(height: 40)
                                Divider()
                                Text("$400")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.systemIndigo))
                                    .font(.system(size: 25))
                                
                            }.padding()
                            .frame(width: UIScreen.main.bounds.width/2.4)
                            .frame(height : UIScreen.main.bounds.height / 5.5)
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(20)
                        }.padding(.bottom, 20)
                        
                        HStack(){
                            
                            
                            NavigationLink(destination: Application()) {
                                Text("Donate")
                                    .font(.system(size: 17))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }.padding()
                            .frame(width: UIScreen.main.bounds.width/2.5)
                            .frame(height : UIScreen.main.bounds.height / 15)
                            .background(Color(.systemIndigo))
                            .cornerRadius(10)
                            .padding(.trailing, 10)
                            
                            
                            
                            Button(action: {
                                showLocationSelector.toggle()
                            }) {
                                
                                Text("Adopt Village")
                                    .font(.system(size: 17))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(height: 50)
                                    .multilineTextAlignment(.center)
                            }.padding()
                            .frame(width: UIScreen.main.bounds.width/2.5)
                            .frame(height : UIScreen.main.bounds.height / 15)
                            .background(Color(.systemIndigo))
                            .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: PersonalInfoForm(rootIsActive: self.$isActive), isActive: self.$isActive) {
                            Text("Submit")
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }                    .isDetailLink(false)

                        .padding()
                        .frame(width: UIScreen.main.bounds.width/2.5)
                        .frame(height : UIScreen.main.bounds.height / 15)
                        .background(Color(.systemIndigo))
                        .cornerRadius(10)
                        .padding(.trailing, 10)
                        
                        
                    }.padding(.all)
                    .padding(.trailing, 5)
                    .navigationBarTitle("Dashboard")
                    .sheet(isPresented: $showLocationSelector) {
                        LocationSelector( isPresented: $showLocationSelector)
                    }
                    
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




