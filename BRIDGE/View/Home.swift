//
//  Hoome.swift
//  Created on 11/09/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct Home: View {
    @ObservedObject var homeViewModel = HomeViewModel()
    var body: some View {
        NavigationView {
        
           
           Button(action: {
            self.homeViewModel.logout()
           }) {
            Text("Logout")
                .foregroundColor(Color(.systemIndigo))
            .fontWeight(.heavy)
            .padding(.vertical)
            .frame(width: (UIScreen.main.bounds.width - 200))
           }
            .navigationBarTitle("Welcome!")
        }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
