//
//  LoanDataViewModel.swift
//  TestCaseClay
//
//  Created by Victor on 01.04.2024.
//

import Foundation

class LoanDataViewModel: BaseViewModel {
    
    @Published var loanData: LoanData?
    
    func fetchLoanData() {
        performNetworkTask {
            let result = try await NetworkManager.fetchLoanData()
            DispatchQueue.main.async {
                print(self.loanData)
                self.loanData = result
            }
        }
    }
}







