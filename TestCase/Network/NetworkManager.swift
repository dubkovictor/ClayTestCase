//
//  NetworkManager.swift
//  TestCaseClay
//
//  Created by Victor on 01.04.2024.
//

import Foundation

class NetworkManager {
    
    @MainActor static func fetchLoanData() async throws -> LoanData {
        return try await NetworkModule.request(responseModelType: .status200(responseModel: LoanData.self)) as! LoanData
    }
}
