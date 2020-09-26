//
//  TabBar.swift
//  Created on 11/09/20
//  Created for Bridge - Adopt Your Village
//


import SwiftUI

struct TabBar: View {
    @Binding var selection: Int

    var body: some View {
        TabView(selection: $selection) {
            //Home
            Home()
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                            .imageScale(.large)
                        Text("Home")
                    }
            }.tag(0)
            
            //Profile
            Profile()
                .tabItem {
                    VStack {
                        Image(systemName: "person.circle.fill")
                            .imageScale(.large)
                        Text("Profile")
                    }
            }.tag(1)
            
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(selection: .constant(1))
    }
}
