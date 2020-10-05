//
//  SubmitApplicationViewModel.swift
//  Created on 05/10/20
//  Created for Bridge - Adopt Your Village
//

import Foundation

class SubmitApplicationViewModel: ObservableObject {
    var applicationData = SubmitApplicationModel.SubmitData(firstName: "",
                                                                  lastName: "", contactNumber: "", aadhaarNumber: "",
                                                                  state: "", district: "", subDistrict: "",
                                                                  area: "", instituteName: "", instituteState: "",
                                                                  instituteDistrict: "", instituteAffiliationCode: "",
                                                                  courseName: "", yearOrSemester: "", amount: "",
                                                                  offerLetter: "", feeStructure: "", bankStatement: "")
    
    func setLocation(locationViewModel: LocationSelectorViewModel, isVillageSelected: Bool) {
        
        applicationData.state = locationViewModel.stateNames[locationViewModel.selectedState]
        applicationData.district = locationViewModel.districtNames[locationViewModel.selectedDistrict]
        if isVillageSelected {
            applicationData.subDistrict = locationViewModel.subDistrictNames[locationViewModel.selectedSubDistrict]
            applicationData.area = locationViewModel.areaNames[locationViewModel.selectedArea]
        }
        
    }
    
    
    
}
