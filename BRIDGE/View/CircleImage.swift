//
//  CircleImage.swift
//  Created on 15/09/20
//  Created for Bridge - Adopt Your Village
//

import Foundation
import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("profile-photo")
            .resizable()
        .frame(width: 140, height: 140)
        .clipShape(Circle())
        .overlay(
            Circle().stroke(Color(.systemGray6), lineWidth:4))
        .shadow(radius: 5)
}
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
