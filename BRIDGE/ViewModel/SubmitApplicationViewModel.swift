//
//  SubmitApplicationViewModel.swift
//  Created on 05/10/20
//  Created for Bridge - Adopt Your Village
//

import Foundation
import Combine


class SubmitApplicationViewModel: ObservableObject {
    @Published var applicationData = SubmitApplicationModel.SubmitData(firstName: "",
                                                                  lastName: "", contactNumber: "", aadhaarNumber: "",
                                                                  state: "", district: "", subDistrict: "",
                                                                  area: "", instituteName: "", instituteState: "",
                                                                  instituteDistrict: "", instituteAffiliationCode: "",
                                                                  courseName: "", yearOrSemester: "", amount: "",
                                                                  offerLetter: "", feeStructure: "", bankStatement: "", instituteType: 0)
    var submitApplicationResponseData = SubmitApplicationModel.NetworkResponse(message: "")
    private var cancellable: AnyCancellable?
    @Published var messageTitle = ""
    @Published var inActivity = false

    
    func setLocation(applicationData: SubmitApplicationModel.SubmitData, locationViewModel: LocationSelectorViewModel, isVillageSelected: Bool) {
        self.applicationData = applicationData
        self.applicationData.state = locationViewModel.stateNames[locationViewModel.selectedState]
        self.applicationData.district = locationViewModel.districtNames[locationViewModel.selectedDistrict]
        if isVillageSelected {
            self.applicationData.subDistrict = locationViewModel.subDistrictNames[locationViewModel.selectedSubDistrict]
            self.applicationData.area = locationViewModel.areaNames[locationViewModel.selectedArea]
        }
        
    }
    
    func setDocuments(documentsModel: DocumentFile)  {
        self.applicationData.offerLetter = documentsModel.offerLetter
        self.applicationData.feeStructure = documentsModel.feeStructure
        self.applicationData.bankStatement = documentsModel.bankStatement
        
    }
    
    func submitApplication(completion: @escaping (String) -> Void) {
        inActivity = true
        
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
                    self.inActivity = false
                    completion(response.message)
                }
        }
        
    }
    
    
    
}
