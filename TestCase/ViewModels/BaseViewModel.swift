//
//  BaseViewModel.swift
//  TestCaseClay
//
//  Created by Victor on 01.04.2024.
//

import Foundation

class BaseViewModel: NSObject, ObservableObject {
    @Published var isLoading = false
    
    func performNetworkTask(task: @escaping () async throws -> ()) {
        isLoading = true
        Task {
            do {
                try await task()
                Task {
                    @MainActor [weak self]  in
                    self?.isLoading = false
                }
            } catch {
                Task {
                    @MainActor [weak self] in
                    self?.isLoading = false
                }
            }
        }
    }
}
