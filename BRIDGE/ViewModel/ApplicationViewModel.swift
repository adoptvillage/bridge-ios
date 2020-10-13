//
//  ApplicationViewModel.swift
//  Created on 12/10/20
//  Created for Bridge - Adopt Your Village
//

import Foundation
import Combine

class ApplicationViewModel: ObservableObject {
    
    @Published var applicationsList = [ApplicationModel.ApplicationData]()
    var applicationAcceptRespnse = ApplicationModel.NetworkResponse(message: "")
    private var cancellable: AnyCancellable?
    @Published var inActivity = false

    
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
    
    func acceptApplication(application: ApplicationModel.AcceptData, completion: @escaping (ApplicationModel.NetworkResponse) -> Void) {
        inActivity = true
        guard let uploadData = try? JSONEncoder().encode(application) else {
            return
        }
        
        FirebaseManager.getToken { (token) in
            self.cancellable = NetworkManager.callAPI(urlString: URLStringConstants.Application.accept, httpMethod: "POST", uploadData: uploadData, token: token)
                .receive(on: RunLoop.main)
                .catch { _ in Just(self.applicationAcceptRespnse) }
                .sink { response in
                    self.inActivity = false
                    completion(response)
                }
        }
    }
    
}
