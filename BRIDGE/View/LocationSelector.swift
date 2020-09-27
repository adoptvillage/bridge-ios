//
//  LocationSelector.swift  
//  Created on 26/09/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct LocationSelector: View {
    @ObservedObject var locationSelectorViewModel = LocationSelectorViewModel()
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    
                    Picker(selection: $locationSelectorViewModel.selectedState, label: Text("State")) {
                        ForEach(0 ..< locationSelectorViewModel.stateNames.count) {index in
                            Text(locationSelectorViewModel.stateNames[index])
                        }
                    }
                    
                    if locationSelectorViewModel.selectedState == 26 {
                        Picker(selection: $locationSelectorViewModel.selectedDistrict, label: Text("District")) {
                            ForEach(0 ..< locationSelectorViewModel.districtNamesCount) { i in
                                Text(locationSelectorViewModel.districtNames[i])
                            }
                        }.id(locationSelectorViewModel.id)
                        Picker(selection: $locationSelectorViewModel.selectedSubDistrict, label: Text("SubDistrict")) {
                            ForEach(0 ..< locationSelectorViewModel.subDistrictNames.count){index in
                                Text(locationSelectorViewModel.subDistrictNames[index])
                            }
                        }.id(locationSelectorViewModel.id)
                        Picker(selection: $locationSelectorViewModel.selectedArea, label: Text("Area")) {
                            ForEach(0 ..< locationSelectorViewModel.areaNames.count){index in
                                Text(locationSelectorViewModel.areaNames[index])
                            }
                        }.id(locationSelectorViewModel.id)
                    } else {
                        Picker(selection: $locationSelectorViewModel.selectedDistrict, label: Text("District")) {
                            ForEach(0 ..< locationSelectorViewModel.districtNamesCount) { i in
                                Text(locationSelectorViewModel.districtNames[i])
                            }
                        }.id(locationSelectorViewModel.id)
                    }
                    
                    Button(action: {
                        print(locationSelectorViewModel.stateNames[locationSelectorViewModel.selectedState])
                        if locationSelectorViewModel.selectedState == 26 {
                            print(locationSelectorViewModel.villageData[locationSelectorViewModel.selectedDistrict].district)
                            print(locationSelectorViewModel.subDistrictNames[locationSelectorViewModel.selectedSubDistrict])
                            print(locationSelectorViewModel.areaNames[locationSelectorViewModel.selectedArea])
                        } else {
                            print(locationSelectorViewModel.districtNames[locationSelectorViewModel.selectedDistrict])
                            
                        }
                    }) {
                        Text("Update")
                    }
                }
            }
            .navigationBarItems(leading:
                                    Button.init(action: {
                                        self.isPresented = false
                                    }, label: {
                                        Image(systemName: "x.circle.fill")
                                            .font(.headline)
                                            .accentColor(.secondary)
                                    }),
                                trailing: Button.init(action: {
                                    print(locationSelectorViewModel.stateNames[locationSelectorViewModel.selectedState])
                                    if locationSelectorViewModel.selectedState == 26 {
                                        print(locationSelectorViewModel.villageData[locationSelectorViewModel.selectedDistrict].district)
                                        print(locationSelectorViewModel.subDistrictNames[locationSelectorViewModel.selectedSubDistrict])
                                        print(locationSelectorViewModel.areaNames[locationSelectorViewModel.selectedArea])
                                    } else {
                                        print(locationSelectorViewModel.districtNames[locationSelectorViewModel.selectedDistrict])
                                        
                                    }
                                }, label: {
                                    Text("Update")
                                })
            )
            .navigationBarTitle("Preferred region")
        }
    }
}

struct LocationSelector_Previews: PreviewProvider {
    static var previews: some View {
        LocationSelector( isPresented: .constant(true))
    }
}
