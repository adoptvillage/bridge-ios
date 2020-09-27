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
                Text("Welcome to Bridge, Please Adopt your village in order to continue")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(.systemGray2))
                    .padding()
                Button(action: {
                    showLocationSelector.toggle()
                }) {
                    Text("Adopt your village")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .padding(.vertical)
                    .frame(width: (UIScreen.main.bounds.width - 200))
                }.background(Color(.systemIndigo))
                .cornerRadius(5.0)
            }
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
