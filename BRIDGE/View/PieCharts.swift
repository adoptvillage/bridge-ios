//
//  PieCharts.swift
//  BRIDGE
//
//  Created by Abhi Kulshrestha on 26/09/20.
//  Copyright © 2020 Abhi Kulshrestha. All rights reserved.
//

import Foundation
import SwiftUI
import SwiftUICharts


struct PieCharts:View {
    let chartStyle = ChartStyle(backgroundColor: .white, accentColor: Color(.systemIndigo), secondGradientColor: Color(.systemIndigo), textColor: Color.black, legendTextColor: Color.gray, dropShadowColor: .black )
    @State var data1: [Double] = (0..<6).map { _ in .random(in: 9.0...100.0) }
   
    var body: some View {
        VStack{
            PieChartView(data: self.data1, title: "Donations", style: chartStyle, form: ChartForm.medium)
            
        }
        
    }
}
