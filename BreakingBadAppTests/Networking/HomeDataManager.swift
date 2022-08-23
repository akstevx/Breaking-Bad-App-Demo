//
//  CharacterDataManager.swift
//  BreakingBadAppTests
//
//  Created by Steven David on 23/08/2022.
//

import Foundation
@testable import BreakingBadApp

class HomeDataManager {
     var offset = 0
     var limit = 10
    var shimmer = true
    var randomQoutes: [Quote] = []

    private let sessionProtocol: SessionProtocol
    
    init(session: SessionProtocol) {
        self.sessionProtocol = session
    }
    
    func getCharacters() async throws -> [Character] {
        guard let url = URL(string: "\(NetworkHelper.baseUrl)characters?limit=\(limit)&offset=\(offset)") else { throw NetworkErrorEnum.invalidURL }
        let data = try await sessionProtocol.execute(url: url)
        
        updateOffset()
        
        return try JSONDecoder().decode([Character].self, from: data)
    }
    
    func getRandomQuote() async throws -> [Quote] {
        guard let url = URL(string: "\(NetworkHelper.baseUrl)quote/random") else { throw NetworkErrorEnum.invalidURL }
        let data = try await sessionProtocol.execute(url: url)
                
        return try JSONDecoder().decode([Quote].self, from: data)
    }
    
    private func updateOffset(){
        shimmer = false
        if self.offset == 0{
            self.offset = 11
            
            return
        }
        
        self.offset += 10
        return
    }
    
    
}
