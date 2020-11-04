//
//  History.swift
//  Created on 04/10/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI
import SwiftUICharts

struct History: View {
    @State var txt = ""
    var body: some View {
        NavigationView{
        VStack {
            HStack{
                VStack{
                   
                    ScrollView{
                        BarChartView(data: ChartData(values: [("2018 Q4",63150), ("2019 Q1",50900), ("2019 Q2",77550), ("2019 Q3",79600), ("2019 Q4",92550),("2020 Q1",50900), ("2020 Q2",77550)]), title: "Donations", legend: "Quarterly", style: Styles.barChartStyleNeonBlueLight, form: ChartForm.extraLarge).padding(.all)
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
