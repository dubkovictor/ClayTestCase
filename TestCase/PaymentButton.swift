//
//  PaymentButton.swift
//  TestCase
//
//  Created by Victor on 01.04.2024.
//

import SwiftUI

struct PaymentButton: View {
    
    var isEnabled: Bool
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
        }
        .disabled(!isEnabled)
        .buttonStyle(PaymentButtonStyle(isDisabled: !isEnabled))
        .padding(.top)
    }
}

struct PaymentButtonStyle: ButtonStyle {
    
    var isDisabled = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Font.SF_Regular_17)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 65)
            .background( isDisabled ? Color(.buttonDisabled) : Color(.buttonPink))
            .cornerRadius(32)
            .opacity(configuration.isPressed ? 0.5 : 1)
        
    }
}
