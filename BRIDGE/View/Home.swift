//
//  Hoome.swift
//  Created on 11/09/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct Home: View {
    @State var showLocationSelector = false
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    showLocationSelector.toggle()
                }) {
                    Text("Select location")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .padding(.vertical)
                    .frame(width: (UIScreen.main.bounds.width - 200))
                }
            }.background(Color(.systemIndigo))
            .navigationBarTitle("Welcome")
            .sheet(isPresented: $showLocationSelector) {
                LocationSelector( isPresented: $showLocationSelector)
            }
        }
    }
}





struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
