//
//  HomeViewModel.swift  
//  Created on 26/09/20
//  Created for Bridge - Adopt Your Village
//

import Foundation
import Combine
import FirebaseAuth

class HomeViewModel: ObservableObject {
    
    @Published var dashboardData =  DashboardModel.DashboardResponse(role: nil, applications: [])
    @Published var preferredLocation = PreferredLocationModel.LocationResponse(state: "", district: "", subDistrict: "", area: "")
    
    private var cancellable: AnyCancellable?
    @Published var inActivity: Bool = false
    
    func getDashboard(completion: @escaping (DashboardModel.DashboardResponse) -> Void) {
        
        inActivity = true
        FirebaseManager.getToken { (token) in
            self.cancellable = NetworkManager.callAPI(urlString: URLStringConstants.User.dashboard, token: token)
                .receive(on: RunLoop.main)
                .catch { _ in Just(self.dashboardData) }
                .sink { dashboard in
                    self.dashboardData = dashboard
                    self.inActivity = false
                    completion(dashboard)
                }
        }
        
        
        
        
    }
    
    
    func getpreferredLocation(completion: @escaping (PreferredLocationModel.LocationResponse) -> Void) {
        
        inActivity = true
        FirebaseManager.getToken { (token) in
            self.cancellable = NetworkManager.callAPI(urlString: URLStringConstants.User.preferredLocation, token: token)
                .receive(on: RunLoop.main)
                .catch { _ in Just(self.preferredLocation) }
                .sink { preferredLocation in
                    self.preferredLocation = preferredLocation
                    self.inActivity = false
                    completion(preferredLocation)
                }
        }
        
        
        
        
    }
    
}
