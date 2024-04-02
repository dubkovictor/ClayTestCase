//
//  TopView.swift
//  TestCase
//
//  Created by Victor on 01.04.2024.
//

import SwiftUI

struct TopView: View {
    
    @EnvironmentObject var viewModel: LoanDataViewModel
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Image("coin_ico")
                }
                Spacer()
            }
            
            VStack(alignment: .leading) {
                
                Spacer()
                
                VStack (alignment: .leading) {
                    Text("Due in \(viewModel.loanData?.paymentDetails.dueInDays ?? 0) days")
                        .font(Font.SF_Regular_17)
                        .foregroundColor(.lightText)
                    HStack {
                        HStack(alignment: .firstTextBaseline) {
                            Text("$" + (viewModel.loanData?.paymentDetails.amountDue1 ?? ""))
                                .font(Font.SF_Regular_56)
                                .foregroundColor(.colorText)
                            Text("." + (viewModel.loanData?.paymentDetails.amountDue2 ?? ""))
                                .font(Font.SF_Regular_36)
                                .foregroundColor(.lightText)
                        }
                        Spacer()
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.init(hex: 0x070911, opacity: 0.6))
                            .frame(width: 64, height: 45)
                            .overlay(
                                HStack {
                                    Text(viewModel.loanData?.loanDetails.lastFourPaymentCard ?? "")
                                        .font(Font.SF_Regular_11)
                                        .foregroundColor(.white)
                                    Image("master_card_icon")
                                }.padding(.top)
                            )
                    }
                    HStack {
                        HStack {
                            Text("Next Payment ")
                                .font(Font.SF_Regular_15)
                                .foregroundColor(.lightText)
                                .accessibilityIdentifier("NextPayment")
                            Text(viewModel.loanData?.paymentDetails.toDataFormat ?? "")
                                .font(Font.SF_Regular_15)
                                .foregroundColor(.colorText)
                        }
                        Spacer()
                        HStack {
                            Text("\(viewModel.loanData?.paymentDetails.paymentProgress.currentPaymentNumber ?? 1)")
                                .font(Font.SF_Regular_15)
                                .foregroundColor(.colorText)
                            Text("of \(viewModel.loanData?.paymentDetails.paymentProgress.totalPayments ?? 10) payments")
                                .font(Font.SF_Regular_15)
                                .foregroundColor(.lightText)
                        }
                    }
                    .padding(.top)
                }
                
                PaymentButton(isEnabled: true, title: "Make a payment") {
                    print("Pink button pressed")
                }
                .accessibilityIdentifier("PaymentButton")
            }
            .frame(height: 470)
            .padding(.horizontal)
        }
        .background(.white)
        .frame(height: 470)
    }
}

#Preview {
    LoanDataView()
}

