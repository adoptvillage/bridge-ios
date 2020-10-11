//
//  ApplicationListCell.swift
//  Created on 28/09/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct ApplicationListCell: View {
    var application: ApplicationModel.ApplicationData
    var membersViewModel: ApplicationViewModel
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("\(application.firstName) \(application.lastName)")
                    .font(.headline)
                    .foregroundColor(Color(.systemIndigo))

                Group {
                    if application.subDistrict.isEmpty && application.area.isEmpty {
                        Text("\(application.state), \(application.district)")
                    } else {
                        Text("\(application.state), \(application.district), \(application.subDistrict), \(application.area)")
                            .multilineTextAlignment(.leading)
                    }
                    Text("\(application.instituteName)")
                }
                .font(.subheadline)
                .foregroundColor(Color.secondary)
            }.padding(.leading, 5)
            Spacer()
            
            VStack(alignment: .trailing, spacing: 0) {
                Text("₹\(application.remainingAmount)")

            }.padding(.trailing, 5)
            .foregroundColor(Color(.systemIndigo))
            

        }.padding(.top, 5)
        .padding(.bottom, 5)
        
            }
}

//struct ApplicationListCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ApplicationListCell(application: <#ApplicationModel.ApplicationData#>, membersViewModel: <#ApplicationViewModel#>)
//    }
//}
