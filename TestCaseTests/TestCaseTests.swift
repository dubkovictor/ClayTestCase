//
//  TestCaseTests.swift
//  TestCaseTests
//
//  Created by Victor on 01.04.2024.
//

import XCTest
@testable import TestCase

final class TestCaseTests: XCTestCase {
    
    var viewModel: LoanDataViewModel!
    
    override func setUpWithError() throws {
        viewModel = LoanDataViewModel()
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testExample() async throws {
        //Given
        var res: LoanData
        
        //When
        res = try await NetworkManager.fetchLoanData()
        
        //Then
        XCTAssertEqual(res.email, "example@example.com")
        XCTAssertEqual(res.loanDetails.interestPaidToDate1, "319")
        XCTAssertEqual(res.loanDetails.interestPaidToDate2, "77")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
