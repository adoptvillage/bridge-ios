//
//  ContentView.swift
//  BRIDGE
//


import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @ObservedObject var authModel = AuthModel()
    
    @ViewBuilder var body: some View {
        if authModel.isLogged! {
            TabBar(selection: $selection)
                .onAppear {
                    // reset selection and show home page whenever login done
                    self.selection = 0
            }
        } else {
            ZStack{
                main()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





