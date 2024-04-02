//
//  LoanDataView.swift
//  TestCaseClay
//
//  Created by Victor on 01.04.2024.
//

import SwiftUI

struct LoanDataView: View {
    @StateObject private var viewModel = LoanDataViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image("back_btn_ico")
                    Spacer()
                }
                Spacer()
            }
            .padding(.leading, 16)
            
            ScrollView {
                TopView()
                    .environmentObject(viewModel)
                    
                LoanDetailsView()
                    .environmentObject(viewModel)
                
                MoreOptionsView()
                    .environmentObject(viewModel)
                
            }
            .onAppear {
                viewModel.fetchLoanData()
            }
        .ignoresSafeArea(.all)
        }
        
    }
}

#Preview {
    LoanDataView()
}


