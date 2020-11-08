//
//  History.swift
//  Created on 04/10/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI
import SwiftUICharts

struct History: View {
    @State var txt = ""
    @ObservedObject var historyViewModel = HistoryViewModel()
    @State var userHistory = HistoryModel.HistoryResponse(role: -1, history: [])
    @State var amountPerQuarter = [0,0,0,0]
    
    func fetchHistory() {
        historyViewModel.getHistoryy { (history) in
            self.userHistory = history
            //            self.amountPerQuarter = historyViewModel.getGraphDetails()
            print(history)
        }
    }
    
    
    var body: some View {
        NavigationView{
            VStack {
                HStack{
                    VStack{
                        
                        ScrollView{
                            if historyViewModel.inActivity {
                                ShimmerView()
                                    .frame(width: UIScreen.main.bounds.width - 40, height : UIScreen.main.bounds.height/3.2)
                                    .padding(.bottom, 10)
                                ShimmerView()
                                    .frame(width: UIScreen.main.bounds.width - 40, height : UIScreen.main.bounds.height/5)
                            } else {
                                BarChartView(data: ChartData(values: [("Jan-Mar",historyViewModel.amountPerQuarter[0]), ("Apr-Jun",historyViewModel.amountPerQuarter[1]), ("Jul-Sep",historyViewModel.amountPerQuarter[2]), ("Oct-Dec",historyViewModel.amountPerQuarter[3])]), title: userHistory.role == 0 ? "Donations" : userHistory.role == 1 ? "Recieved Money" : "Money Processed", legend: "Quarterly", style: Styles.barChartStyleNeonBlueLight, form: ChartForm.extraLarge).padding(.all)
                                
                                ForEach(userHistory.history) { history in
                                    HistoryCard(historyDetail: history)
                                        .padding(.bottom, 5)
                                }
                            }
                            
                        }
                    }
                }
            }
            .navigationBarTitle("History")
        }
        
        .onAppear() {
            fetchHistory()
        }
        
    }
}


struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
