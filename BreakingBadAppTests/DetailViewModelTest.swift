//
//  DetailViewModelTest.swift
//  BreakingBadAppTests
//
//  Created by Steven David on 23/08/2022.
//

import XCTest
@testable import BreakingBadApp

class DetailViewModelTest: XCTestCase {
    var detailViewModel:DetailViewModel!
    var session: SessionProtocol!
    var dataManager: DetailDataManager!

    override func setUp() async throws {
        detailViewModel = DetailViewModel(id: 1)
        self.session = NetworkSession()
        self.dataManager = DetailDataManager(session: session)
    }
    
    func test_characterIsNotNull() async throws {
        //tesing getCharacterById returns character
        do {
            let character = try await dataManager.getCharacterID()
                        
            XCTAssertTrue(!character.isEmpty , "Character array is empty")
        } catch {
            XCTFail("Expected beer data, but failed \(error).")
        }
        
    }
    
    func test_quoteIsFetched() async throws {
        //testing quote is not null

        do {
            let character = try await dataManager.getCharacterID()
            dataManager.name = character.first?.name
            
            let characterQuote = try await dataManager.getQuotes()

            XCTAssertTrue(dataManager.concatenatedName != nil, "Character array is empty")
            XCTAssertTrue(!characterQuote.isEmpty, "Quote is empty")

        } catch {
            XCTFail("Expected beer data, but failed \(error).")
        }
        
    }

    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
