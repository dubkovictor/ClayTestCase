//
//  MoreOptionsView.swift
//  TestCase
//
//  Created by Victor on 02.04.2024.
//

import SwiftUI

struct MoreOptionsView: View {
    @EnvironmentObject var viewModel: LoanDataViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("More \nOptions")
                .font(Font.SF_Regular_36)
                .foregroundColor(.colorText)
            
            HStack {
                VStack (alignment: .leading) {
                    Text("Increase Paydown Credit")
                        .font(Font.SF_Regular_17)
                        .foregroundColor(.white)
                        .padding(.bottom, 5)
                    Text("Up to $" + (viewModel.loanData?.loanDetails.maxCreditAmount.formatNumber() ?? ""))
                        .font(Font.SF_Regular_15)
                        .foregroundColor(.white).opacity(0.8)
                }
                .padding(.leading)
                Spacer()
                Image("back_btn_ico")
                    .padding(.trailing)
            }
            .frame(height: 87)
            .background(.purpur)
            .cornerRadius(20)
            
            HStack {
                VStack (alignment: .leading){
                    Text("Change repayment date")
                        .font(Font.SF_Regular_17)
                        .foregroundColor(.colorText)
                        .padding(.bottom, 5)
                    Text("Account ending " + (viewModel.loanData?.loanDetails.lastFourPaymentCard ?? ""))
                        .font(Font.SF_Regular_15)
                        .foregroundColor(.lightText)
                }
                .padding(.leading)
                Spacer()
                Image("back_btn_ico")
                    .padding(.trailing)
            }
            .frame(height: 87)
            .background(.white)
            .cornerRadius(20)
            
            HStack {
                VStack (alignment: .leading){
                    Text("Change personal information")
                        .font(Font.SF_Regular_17)
                        .foregroundColor(.colorText)
                        .padding(.bottom, 5)
                    Text((viewModel.loanData?.email ?? ""))
                        .font(Font.SF_Regular_15)
                        .foregroundColor(.lightText)
                }
                .padding(.leading)
                Spacer()
                Image("back_btn_ico")
                    .padding(.trailing)
            }
            .frame(height: 87)
            .background(.white)
            .cornerRadius(20)
            
            HStack {
                VStack (alignment: .leading){
                    Text("View saved documents")
                        .font(Font.SF_Regular_17)
                        .foregroundColor(.colorText)
                        .padding(.bottom, 5)
                    Text("\(viewModel.loanData?.loanDetails.numberOfDocuments ?? 0) documents")
                        .font(Font.SF_Regular_15)
                        .foregroundColor(.lightText)
                }
                .padding(.leading)
                Spacer()
                Image("back_btn_ico")
                    .padding(.trailing)
            }
            .frame(height: 87)
            .background(.white)
            .cornerRadius(20)
            
            
        }
        .padding()
        .background(Color.section)
        .cornerRadius(32)
    }
}
