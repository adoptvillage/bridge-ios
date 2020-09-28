//
//  Application.swift
//  Created on 11/09/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct Application: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0 ..< 10) {_ in 
                    ApplicationListCell()
                }
            }.navigationBarTitle(Text("Applications"))
        }
    }
}

struct Application_Previews: PreviewProvider {
    static var previews: some View {
        Application()
    }
}
