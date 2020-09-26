//
//  Hoome.swift
//  Created on 11/09/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct Home: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Dashboard")
            }
            .navigationBarTitle("Welcome")
        }
    }
}





struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
