//
//  HistoryViewModel.swift
//  Created on 08/11/20
//  Created for Bridge - Adopt Your Village
//

import Foundation
import Combine

class HistoryViewModel: ObservableObject {
    
    @Published var historyResponse = HistoryModel.HistoryResponse(role: -1, history: [])
    @Published var inActivity = false
    private var cancellable: AnyCancellable?
    @Published var amountPerQuarter = [0,0,0,0]
    
    func getHistoryy(completion: @escaping (HistoryModel.HistoryResponse) -> Void) {
        inActivity = true
        FirebaseManager.getToken { (token) in
            self.cancellable = NetworkManager.callAPI(urlString: URLStringConstants.User.history, token: token)
                .receive(on: RunLoop.main)
                .catch { _ in Just(self.historyResponse) }
                .sink { historyResponse in
                    self.historyResponse = historyResponse
                    self.getGraphDetails()
                    self.inActivity = false
                    completion(historyResponse)
                }
        }
    }
    
    
    func getGraphDetails() {
        let today = Date()
        let currentYear = today.get(.year)
        print(currentYear)
        var amountPerQuarter = [0,0,0,0]
        for history in historyResponse.history {
            let date = history.donationDate.getFormattedDate()
            if let year = date?.get(.year) {
                if year == currentYear {
                    if let month = date?.get(.month) {
                        if month == 1 || month == 2 || month == 3 {
                            amountPerQuarter[0] = amountPerQuarter[0] + history.amount
                        }
                        else if month == 4 || month == 5 || month == 6 {
                            amountPerQuarter[1] = amountPerQuarter[1] + history.amount
                        }
                        else if month == 7 || month == 8 || month == 9 {
                            amountPerQuarter[2] = amountPerQuarter[2] + history.amount
                        }
                        else {
                            amountPerQuarter[3] = amountPerQuarter[3] + history.amount
                        }
                    }
                    
                }
            }
        }
        self.amountPerQuarter = amountPerQuarter
    }
    
    
}
