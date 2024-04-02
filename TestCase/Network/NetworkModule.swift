//
//  NetworkModule.swift
//  TestCaseClay
//
//  Created by Victor on 01.04.2024.
//

import Foundation

public enum ResponseTypeModel {
    
    case status200(responseModel: Codable.Type), // Ok
         status201, // Entity is created
         status202, // Accepted
         status204 //No Content
    
    var code: Int {
        switch self {
            case .status200:
                return 200
            case .status201:
                return 201
            case .status202:
                return 202
            case .status204:
                return 204
        }
    }
}

public class NetworkModule {
    
    @discardableResult
    @MainActor public static func request(
        baseUrl: String? = nil,
        path: String? = nil,
        responseModelType: ResponseTypeModel) async throws -> Codable? {
            
            do {
                
                guard let pathString = Bundle(for: self as AnyClass).path(forResource: "@Mock-LoanData", ofType: "json") else {
                    fatalError("TestData.json not found")
                }
                
                guard let data = try? Data(contentsOf: URL(fileURLWithPath: pathString)),
                      let mockyJSON = try? JSONDecoder().decode(LoanData.self, from: data)
                else {
                    throw NetworkError.customError(.init(message: "The code is \(000), but must be \(200)"))
                }
                return mockyJSON
            } catch {
                throw error
                
            }
        }
}
