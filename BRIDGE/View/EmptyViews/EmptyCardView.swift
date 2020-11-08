//
//  EmptyCardView.swift
//  Created on 05/11/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct EmptyCardView: View {
    var role: Int
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            Text("Welcome")
                .font(Font.largeTitle)
            if role == 0 {
                // USer is donnor
                Text("Start Donating by adopting a village")
                    .foregroundColor(Color(.systemGray))
                    .font(Font.headline)
                    .multilineTextAlignment(.center)
            } else if role == 1 {
                //user is recipient
                Text("Submit application and reach to Bridge donors")
                    .font(Font.headline)
                    .foregroundColor(Color(.systemGray))
                    .multilineTextAlignment(.center)
            } else if role == 2 {
                Text("No applications to review as of now")
                    .font(Font.headline)
                    .foregroundColor(Color(.systemGray))
                    .multilineTextAlignment(.center)
            }
            
        }.padding(.all)
        .frame(width: UIScreen.main.bounds.width - 40)
        .frame(height : UIScreen.main.bounds.height / 3.2)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(20)
        
    }
}
//
//struct EmptyCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmptyCardView()
//    }
//}
