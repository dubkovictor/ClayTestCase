//
//  NetworkError.swift
//  TestCaseClay
//
//  Created by Victor on 01.04.2024.
//

import Foundation

public enum NetworkError: Error {
    case missingURL
    case missingAccessToken
    case noResponse
    case gatewayTimeout
    case unexpectedStatusCode
    case customError(APIErrorModel)
    
    public var apiErrorModel: APIErrorModel? {
        switch self {
            case .customError(let aPIErrorModel):
                return aPIErrorModel
            default:
                return nil
        }
    }
}

public struct APIErrorModel: Error, Decodable {
    public let message: String?
}

extension Error {
    
    var isNetworkError: Bool {
        switch (self as NSError).code {
            case NSURLErrorCannotFindHost, NSURLErrorDNSLookupFailed, NSURLErrorDataNotAllowed, NSURLErrorNetworkConnectionLost, NSURLErrorNotConnectedToInternet, NSURLErrorTimedOut:
                return true
            default:
                return false
        }
    }
    
}
