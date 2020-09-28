//
//  ApplicationListCell.swift
//  Created on 28/09/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct ApplicationListCell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            //Name
            Text("Name")
                .font(.headline)

            Group {
                //Availability: mentor and/or mentee
                Text("Amount")

                //Skills
                Text("area")
            }
            .font(.subheadline)
            .foregroundColor(Color.secondary)
        }
    }
}

struct ApplicationListCell_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationListCell()
    }
}
