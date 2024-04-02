//
//  TestCaseUITests.swift
//  TestCaseUITests
//
//  Created by Victor on 01.04.2024.
//

import XCTest
import SwiftUI
@testable import TestCase

final class TestCaseUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        let paymentButton = app.buttons["PaymentButton"]
        XCTAssertTrue(paymentButton.exists)
        paymentButton.tap()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    func testSuggestedDynamicsTitleDisplay() {
        let nextPaymentTitleText = app.staticTexts["NextPayment"]
        
        XCTAssertTrue(nextPaymentTitleText.exists)
    }
}
