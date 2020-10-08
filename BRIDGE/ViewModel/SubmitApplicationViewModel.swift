//
//  SubmitApplicationViewModel.swift
//  Created on 05/10/20
//  Created for Bridge - Adopt Your Village
//

import Foundation
import Combine


class SubmitApplicationViewModel: ObservableObject {
    var applicationData = SubmitApplicationModel.SubmitData(firstName: "",
                                                                  lastName: "", contactNumber: "", aadhaarNumber: "",
                                                                  state: "", district: "", subDistrict: "",
                                                                  area: "", instituteName: "", instituteState: "",
                                                                  instituteDistrict: "", instituteAffiliationCode: "",
                                                                  courseName: "", yearOrSemester: "", amount: "",
                                                                  offerLetter: "", feeStructure: "", bankStatement: "")
    var submitApplicationResponseData = SubmitApplicationModel.NetworkResponse(message: "")
    private var cancellable: AnyCancellable?
    @Published var messageTitle = ""

    
    func setLocation(locationViewModel: LocationSelectorViewModel, isVillageSelected: Bool) {
        
        applicationData.state = locationViewModel.stateNames[locationViewModel.selectedState]
        applicationData.district = locationViewModel.districtNames[locationViewModel.selectedDistrict]
        if isVillageSelected {
            applicationData.subDistrict = locationViewModel.subDistrictNames[locationViewModel.selectedSubDistrict]
            applicationData.area = locationViewModel.areaNames[locationViewModel.selectedArea]
        }
        
    }
    
    func submitApplication(completion: @escaping (String) -> Void) {
        
        guard let uploadData = try? JSONEncoder().encode(applicationData) else {
            return
        }
        
        FirebaseManager.getToken { (token) in
            self.cancellable = NetworkManager.callAPI(urlString: URLStringConstants.Application.submit, httpMethod: "POST", uploadData: uploadData, token: token)
                .receive(on: RunLoop.main)
                .catch { _ in Just(self.submitApplicationResponseData) }
                .sink { response in
                    if NetworkManager.responseCode == 201 {
                        completion("Application submitted")
                    }
                    print(response.message ?? "")
                    completion(response.message)
                }
        }
        
    }
    
    
    
}
