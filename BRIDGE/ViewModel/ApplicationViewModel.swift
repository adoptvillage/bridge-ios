//
//  ApplicationViewModel.swift
//  Created on 12/10/20
//  Created for Bridge - Adopt Your Village
//

import Foundation
import Combine

class ApplicationViewModel: ObservableObject {
    
    @Published var applicationsList = [ApplicationModel.ApplicationData]()
    private var cancellable: AnyCancellable?

    
    func fetchApplications(completion: @escaping ([ApplicationModel.ApplicationData]) -> Void) {
        
        FirebaseManager.getToken { (token) in
            self.cancellable = NetworkManager.callAPI(urlString: URLStringConstants.Application.fetch, token: token)
                .receive(on: RunLoop.main)
                .catch { _ in Just(self.applicationsList) }
                .sink { applicationsList in
                    print(applicationsList)
                    completion(applicationsList)
                }
        }
        
        
    }
    
    func acceptApplication(application: ApplicationModel.AcceptData) {
        
        guard let uploadData = try? JSONEncoder().encode(application) else {
            return
        }
        
//        FirebaseManager.getToken { (token) in
//            self.cancellable = NetworkManager.callAPI(urlString: URLStringConstants.Application.fetch, token: token)
//                .receive(on: RunLoop.main)
//                .catch { _ in Just(self.applicationsList) }
//                .sink { applicationsList in
//                    print(applicationsList)
//                    completion(applicationsList)
//                }
//        }
    }
    
}
