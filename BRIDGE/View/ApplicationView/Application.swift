//
//  Application.swift
//  Created on 11/09/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct Application: View {
    var body: some View {
        List {
            ForEach(0 ..< 4) {_ in
                ApplicationListCell()
            }
        }.navigationBarTitle(Text("Application"))
    }
}

struct Application_Previews: PreviewProvider {
    static var previews: some View {
        Application()
    }
}
