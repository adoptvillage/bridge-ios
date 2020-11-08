//
//  LocationSelector.swift  
//  Created on 26/09/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct LocationSelector: View {
    @ObservedObject var locationSelectorViewModel = LocationSelectorViewModel()
    @Binding var isPresented: Bool
    @State var alertMessage = ""
    @State var showAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    
                    Picker(selection: $locationSelectorViewModel.selectedState, label: Text("State")) {
                        ForEach(0 ..< locationSelectorViewModel.stateNames.count) { index in
                            Text(locationSelectorViewModel.stateNames[index])
                        }
                    }
                    
                    if locationSelectorViewModel.selectedState == 26 {
                        Picker(selection: $locationSelectorViewModel.selectedDistrict, label: Text("District")) {
                            ForEach(0 ..< locationSelectorViewModel.districtNamesCount) { index in
                                Text(locationSelectorViewModel.districtNames[index])
                            }
                        }.id(locationSelectorViewModel.id)
                        Picker(selection: $locationSelectorViewModel.selectedSubDistrict, label: Text("SubDistrict")) {
                            ForEach(0 ..< locationSelectorViewModel.subDistrictNames.count){index in
                                Text(locationSelectorViewModel.subDistrictNames[index])
                            }
                        }.id(locationSelectorViewModel.id)
                        Picker(selection: $locationSelectorViewModel.selectedArea, label: Text("Area")) {
                            ForEach(0 ..< locationSelectorViewModel.areaNames.count){ index in
                                Text(locationSelectorViewModel.areaNames[index])
                            }
                        }.id(locationSelectorViewModel.id)
                    } else {
                        Picker(selection: $locationSelectorViewModel.selectedDistrict, label: Text("District")) {
                            ForEach(0 ..< locationSelectorViewModel.districtNamesCount) { index in
                                Text(locationSelectorViewModel.districtNames[index])
                            }
                        }.id(locationSelectorViewModel.id)
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
                                    locationSelectorViewModel.updatePreferredLocation { (respone) in
                                        showAlert.toggle()
                                        alertMessage = respone
                                    }
                                    
                                }, label: {
                                    Text("Save")
                                })
            )
            .navigationBarTitle("Preferred region")
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertMessage), dismissButton: .default(Text("OK")) {
                        self.isPresented = false})
            }
        }
    }
}

struct LocationSelector_Previews: PreviewProvider {
    static var previews: some View {
        LocationSelector( isPresented: .constant(true))
    }
}
