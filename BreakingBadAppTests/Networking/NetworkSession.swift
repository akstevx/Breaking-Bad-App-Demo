//
//  NetworkSession.swift
//  BreakingBadAppTests
//
//  Created by Steven David on 23/08/2022.
//

import Foundation

class NetworkSession: SessionProtocol {
    
    func execute(url: URL?) async throws -> Data {
        guard let url = url else { throw NetworkErrorEnum.invalidURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}

protocol SessionProtocol {
  func execute(url: URL?) async throws -> Data
}


enum NetworkErrorEnum: Error {
    case invalidURL
    case missingData
}
