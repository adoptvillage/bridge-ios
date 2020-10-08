//
//  ApplicationListCell.swift
//  Created on 28/09/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct ApplicationListCell: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("Vatsal Kulshreshtha")
                    .font(.headline)
                    .foregroundColor(Color(.systemIndigo))

                Group {
                    Text("Jaipur, Rajasthan")
                    Text("Chandigarh University")
                }
                .font(.subheadline)
                .foregroundColor(Color.secondary)
            }.padding(.leading, 5)
            Spacer()
            
            VStack(alignment: .trailing, spacing: 0) {
                Text("$300")

            }.padding(.trailing, 5)
            .foregroundColor(Color(.systemIndigo))
            

        }.padding(.top, 5)
        .padding(.bottom, 5)
        
            }
}

struct ApplicationListCell_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationListCell()
    }
}
