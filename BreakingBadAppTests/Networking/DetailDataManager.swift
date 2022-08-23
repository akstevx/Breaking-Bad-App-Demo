//
//  DetailDataManager.swift
//  BreakingBadAppTests
//
//  Created by Steven David on 23/08/2022.
//

import Foundation
@testable import BreakingBadApp

class DetailDataManager {
    var id = 1
    var shimmer = true
    var randomQoutes: [Quote] = []
    var name:String? = nil
    var concatenatedName:String? = nil

    private let sessionProtocol: SessionProtocol
    
    init(session: SessionProtocol) {
        self.sessionProtocol = session
    }
    
    func getCharacterID() async throws -> [Character] {
        guard let url = URL(string: "\(NetworkHelper.baseUrl)characters/\(id)") else { throw NetworkErrorEnum.invalidURL }
        let data = try await sessionProtocol.execute(url: url)
                
        return try JSONDecoder().decode([Character].self, from: data)
    }
    
    func getQuotes() async throws -> [Quote] {
        guard let url = URL(string: "\(NetworkHelper.baseUrl)quote?author=\(self.catenateName())") else { throw NetworkErrorEnum.invalidURL }
        let data = try await sessionProtocol.execute(url: url)
                
        return try JSONDecoder().decode([Quote].self, from: data)
    }
    
    func catenateName()-> String{
        if let nameString = name{
            let fullNameArr = nameString.components(separatedBy: " ")
            let firstName = fullNameArr[0] //First
            let lastName = fullNameArr[1] //Last
                        
            concatenatedName = "\(firstName)+\(lastName)"
            return concatenatedName!
        }
        
        return ""
    }
    
    
}
