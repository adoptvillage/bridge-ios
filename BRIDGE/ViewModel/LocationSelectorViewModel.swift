//
//  LocationSelectorViewModel.swift  
//  Created on 26/09/20
//  Created for Bridge - Adopt Your Village
//

import Foundation

class LocationSelectorViewModel: ObservableObject {
    private var districtSelections: [Int: Int] = [:]
    private var subDistrictSelections: [Int: Int] = [:]
    private var areaSelections: [Int: Int] = [:]
    @Published var id: UUID = UUID()
    @Published var allStates: [States]!
    @Published var villageData: [District]!
    @Published var selectedState: Int = 0 {
        willSet {
//            print("state changed", newValue, districtSelections[newValue] ?? 0)
            selectedDistrict = districtSelections[newValue] ?? 0
            id = UUID()
        }
    }
    @Published var selectedDistrict: Int = 0 {
        willSet {
            DispatchQueue.main.async { [newValue] in
//                print("district changed", newValue)
                self.selectedSubDistrict = self.subDistrictSelections[newValue] ?? 0
                self.districtSelections[self.selectedState] = newValue
            }
            id = UUID()
        }
    }
    
    @Published var selectedSubDistrict: Int = 0 {
        willSet {
            DispatchQueue.main.async { [newValue] in
//                print("subdistrict changed", newValue)
                self.selectedArea = self.areaSelections[newValue] ?? 0
                self.subDistrictSelections[self.selectedDistrict] = newValue
            }
            id = UUID()
        }
    }
    @Published var selectedArea: Int = 0 {
        willSet {
            DispatchQueue.main.async { [newValue] in
//                print("area changed", newValue)
                self.areaSelections[self.selectedSubDistrict] = newValue
            }
            id = UUID()
        }
    }
    
    var stateNames: [String] {
        allStates.map { (st) in
            st.state
        }
    }
    
    var districtNamesCount: Int {
        districtNames.count
    }
    
    var districtNames: [String] {
        if selectedState == 26 {
            return villageData.map { (districts) in
                districts.district
            }
        } else {
            return allStates[selectedState].districts.map { (district) in
                district
            }
        }
        
    }
    
    var subDistrictNames: [String] {
        villageData[selectedDistrict].subDistricts.map { (area) in
            area.subDistrict
        }
    }
    
    var areaNames: [String] {
        villageData[selectedDistrict].subDistricts[selectedSubDistrict].villages.map { (area) in
            area
        }
    }
    
    init() {
        getLocation()
    }
    
    
    func getLocation() {
        LocatinDataService.getData(file: "location") { (location: Location) in
            self.allStates = location.states
        }
        LocatinDataService.getData(file: "punjabVillages") { (villages: VillageData) in
            self.villageData = villages.data
        }
        
        
    }
    
    func updatePreferredRegion() {
        print(stateNames[selectedState])
        if selectedState == 26 {
            print(villageData[selectedDistrict].district)
            print(subDistrictNames[selectedSubDistrict])
            print(areaNames[selectedArea])
        } else {
            print(districtNames[selectedDistrict])
            
        }
    }
    
}
