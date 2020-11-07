//
//  Home.swift
//  Created on 11/09/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI
import SwiftUIRefresh

struct Home: View {
    @State var isActive : Bool = false
    @State var showLocationSelector = false
    @State var showApplicationSubmitView = false
    @State var index = 0
    @State var refreshShowing = false
    @ObservedObject var homeViewModel = HomeViewModel()
    @State var applications = [DashboardModel.ApplicationData]()
    @State var preferredLocation = PreferredLocationModel.LocationResponse(state: "", district: "", subDistrict: "", area: "")
    @State var role = -1
    
    func fetchDashboard() {
        homeViewModel.getDashboard { (dashboard) in
            if dashboard.role == 0 {
                homeViewModel.getpreferredLocation { (location) in
                    self.preferredLocation = location
                    self.applications = dashboard.applications
                    self.role = dashboard.role ?? -1
                    print(applications)
                    refreshShowing = false
                }
            }
            
        }
    }
    
    var body: some View {
        NavigationView {
            GeometryReader{ geometry in
                
                ScrollView{
                    
                    VStack{
                        
                        if #available(iOS 14.0, *) {
                            if homeViewModel.inActivity == true {
                                ActivityIndicator(isAnimating: $homeViewModel.inActivity)
                            } else {
                                if applications.count == 0 {
                                    EmptyCardView(role: role)
                                        .padding()
                                } else {
                                    TabView(selection: self.$index){
                                        ForEach(applications) { application in
                                            CardView(applicationData: application)
                                        }
                                    }.frame(height : UIScreen.main.bounds.height/3)
                                    .tabViewStyle(PageTabViewStyle())
                                    .animation(.easeOut)
                                }
                            }
                        } else {
                            // Fallback on earlier versions
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing:20){
                                    if applications.count == 0 {
                                        EmptyCardView(role: role)
                                            .padding()
                                    } else {
                                        ForEach(applications) { application in
                                            CardView(applicationData: application)
                                        }.padding(.bottom)
                                    }
                                }
                                
                            }
                            
                        }
                        
                        
                        if role == 0 {
                            //User id donor
                            VStack(alignment: .center, spacing: 12) {
                                
                                Text("Adopted Village")
                                    .fontWeight(.bold)
                                    .font(.system(size: 25))
                                    .foregroundColor(Color(.systemIndigo))
                                    .padding(.top)
                                    .padding(.bottom, 5)
                                
                                Divider()
                                
                                if preferredLocation.state == "" && preferredLocation.district == "" && preferredLocation.subDistrict == "" && preferredLocation.area == "" {
                                    Button(action: {
                                        print(preferredLocation)
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
                                    
                                } else {
                                    
                                    Text("\(preferredLocation.state), \(preferredLocation.district), \(preferredLocation.subDistrict), \(preferredLocation.area)")
                                        .fontWeight(.bold)
                                        .font(.system(size: 20))
                                        .foregroundColor(Color(.systemGray))
                                        .padding(.top)
                                        .padding(.bottom, 5)
                                        .multilineTextAlignment(.center)
                                }
                                
                                    
                            }
                            .padding(.all)
                            .frame(width: UIScreen.main.bounds.width - 40)
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(20)
                            .padding(.bottom, 5)
                            
                            HStack() {
                                
                                
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
                            }

                        }
                        
                        if role == 1 {
                            //User is recipient
                            
                            NavigationLink(destination: PersonalInfoForm(rootIsActive: self.$isActive), isActive: self.$isActive) {
                                
                                Text("Submit Application")
                                    .font(.system(size: 17))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }                    .isDetailLink(false)
                            
                            .padding()
                            .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 15, alignment: .center)
                            .background(Color(.systemIndigo))
                            .cornerRadius(10)
                            
                        }
                         
                        
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    .navigationBarTitle("Dashboard")
                    .sheet(isPresented: $showLocationSelector) {
                        LocationSelector( isPresented: $showLocationSelector)
                    }
                    
                    .pullToRefresh(isShowing: $refreshShowing) {
                        homeViewModel.getDashboard { (dashboard) in
                            
                            self.applications = dashboard.applications
                            self.role = dashboard.role ?? -1
                            print(applications)
                            refreshShowing = false
                        }
                    }
                }
                
            }
            if self.applications.count == 0 {
                ActivityIndicator(isAnimating: .constant(true))
                    .onAppear {
                        self.fetchDashboard()
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




