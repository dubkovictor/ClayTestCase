//
//  LoanDetailsView.swift
//  TestCase
//
//  Created by Victor on 02.04.2024.
//

import SwiftUI

struct LoanDetailsView: View {
    @EnvironmentObject var viewModel: LoanDataViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Loan \nDetails")
                    .font(Font.SF_Regular_36)
                    .foregroundColor(.colorText)
            }
            .padding(.bottom)
            HStack {
                HStack {
                    Text("Left")
                        .font(Font.SF_Regular_17)
                        .foregroundColor(.lightText)
                    Text("$\(viewModel.loanData?.loanDetails.remainingBalance ?? 0)")
                        .font(Font.SF_Regular_17)
                        .foregroundColor(.colorText)
                }
                Spacer()
                HStack {
                    Text("Amount Borrowed")
                        .font(Font.SF_Regular_17)
                        .foregroundColor(.lightText)
                    Text("$" + (viewModel.loanData?.loanDetails.amountBorrowed.formatNumber() ?? ""))
                }
            }
            
            Image("green_progress_ico")
                .padding(.bottom)
            
            HStack {
                InterestItemView()
                InterestRateItemView()
            }
            
            HStack {
                LoanIDItemView()
                UpcomingItemView()
            }
        }
        .padding()
        .background(Color.section)
        .cornerRadius(32)
    }
}

struct InterestItemView: View {
    @EnvironmentObject var viewModel: LoanDataViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Interest")
                .font(Font.SF_Regular_15)
                .foregroundColor(.lightText)
                .padding(.top)
            Spacer()
            HStack(alignment: .firstTextBaseline) {
                Text("$" + (viewModel.loanData?.loanDetails.interestPaidToDate1 ?? ""))
                    .font(Font.SF_Regular_24)
                    .foregroundColor(.colorText)
                    .padding(.trailing, -8)
                Text("." + (viewModel.loanData?.loanDetails.interestPaidToDate2 ?? ""))
                    .font(Font.SF_Regular_17)
                    .foregroundColor(.lightText)
                Spacer()
            }
            .padding(.bottom)
        }
        .padding(.leading)
        .frame(height: 124)
        .frame(width: 184)
        .background(.white)
        .cornerRadius(16.0)
    }
}

struct InterestRateItemView: View {
    @EnvironmentObject var viewModel: LoanDataViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Interest Rate")
                .font(Font.SF_Regular_15)
                .foregroundColor(.lightText)
                .padding(.top)
            Spacer()
            HStack(alignment: .firstTextBaseline) {
                Text( String(format: "%.01f", viewModel.loanData?.loanDetails.interestRate ?? 0) + "%")
                    .font(Font.SF_Regular_24)
                    .foregroundColor(.colorText)
                Spacer()
            }
            .padding(.bottom)
        }
        .padding(.leading)
        .frame(height: 124)
        .frame(width: 184)
        .background(.white)
        .cornerRadius(16.0)
    }
}

struct LoanIDItemView: View {
    @EnvironmentObject var viewModel: LoanDataViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Loan ID")
                .font(Font.SF_Regular_15)
                .foregroundColor(.lightText)
                .padding(.top)
            Spacer()
            HStack(alignment: .firstTextBaseline) {
                Text("\(viewModel.loanData?.loanDetails.loanID ?? "")")
                    .font(Font.SF_Regular_24)
                    .foregroundColor(.colorText)
                Spacer()
            }
            .padding(.bottom)
        }
        .padding(.leading)
        .frame(height: 124)
        .frame(width: 184)
        .background(.white)
        .cornerRadius(16.0)
    }
}

struct UpcomingItemView: View {
    @EnvironmentObject var viewModel: LoanDataViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Image("upcoming_btn_ico")
            }
            .padding(.top, 5)
            .padding(.trailing, 5)
            Spacer()
            HStack(alignment: .firstTextBaseline) {
                Text("Upcoming \npayments")
                    .font(Font.SF_Regular_17)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.bottom)
        }
        .padding(.leading)
        .frame(height: 124)
        .frame(width: 184)
        .background(.buttonPink)
        .cornerRadius(16.0)
    }
}

