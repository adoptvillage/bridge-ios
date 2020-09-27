//
//  BarCharts.swift
//  BRIDGE
//
//  Created by Abhi Kulshrestha on 26/09/20.
//  Copyright © 2020 Abhi Kulshrestha. All rights reserved.
//

import Foundation
import SwiftUI
import SwiftUICharts

struct BarCharts:View{
    let chartStyle = ChartStyle(backgroundColor: .white, accentColor: Color(.systemIndigo), secondGradientColor: Color(.systemIndigo), textColor: Color.black, legendTextColor: Color.gray, dropShadowColor: .black )
    var body : some View{
        VStack{
            BarChartView(data: ChartData(values: [("2018 Q4",63150), ("2019 Q1",50900), ("2019 Q2",77550), ("2019 Q3",79600), ("2019 Q4",92550), ("2020 Q1", 89842), ("2020 Q2", 75847)]), title: "Applications Made"
                         , style: chartStyle, form: ChartForm.extraLarge)
        }
       
}
}
