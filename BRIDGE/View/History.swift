//
//  History.swift
//  Created on 04/10/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct History: View {
    @State var txt = ""
    var body: some View {
        NavigationView{
        VStack {
            HStack{
                VStack{
                    ScrollView{
                        ForEach(0 ..< 7) {_ in
                            CardView1()
                                .padding(.bottom, 5)
                        }
                    }
                }
            }
        }.navigationBarTitle("History")
        
    }
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
