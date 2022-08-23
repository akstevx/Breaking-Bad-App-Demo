//
//  HomeViewModelTest.swift
//  BreakingBadAppTests
//
//  Created by Steven David on 23/08/2022.
//

import XCTest
@testable import BreakingBadApp

class HomeViewModelTest: XCTestCase {

    var homeViewModel:HomeViewModel!
    
    override func setUp() async throws {
        homeViewModel = HomeViewModel()
    }
    
    func test_ghetCharachters() async throws{
        //testing homeViewModel.getCharacters() return a quote when api is called
        let session = NetworkSession()
        let dataManager = HomeDataManager(session: session)
        
        do {
            let characterList = try await dataManager.getCharacters()
            XCTAssertTrue(characterList.count > 0, "Character array is empty")
        } catch {
            XCTFail("Expected beer data, but failed \(error).")
        }
    }
    
    func test_getRandomQuotes() async throws {
        //testing homeViewModel.getQuotes() return a quote when api is called
        let session = NetworkSession()
        let dataManager = HomeDataManager(session: session)
    
        do {
            let quote = try await dataManager.getRandomQuote()
            
            dataManager.randomQoutes.append(contentsOf: quote)
            XCTAssertTrue(dataManager.randomQoutes.count > 0 , "Error! Shimmer Still loading")
        } catch {
            XCTFail("Expected beer data, but failed \(error).")
        }
      }
    
    func test_shimmer_loader() async throws {
        //testing shimmer returns false after characters have loaded
        let session = NetworkSession()
        let dataManager = HomeDataManager(session: session)
    
        do {
            _ = try await dataManager.getCharacters()
            XCTAssertTrue(dataManager.shimmer == false , "Error! Shimmer Still loading")
        } catch {
            XCTFail("Expected beer data, but failed \(error).")
        }
    }
    
    func test_offSetCounter() async throws {
        //testing offset for getCharacterList pagination (the first offset = 11, subsiquently we increment by 10)
        let session = NetworkSession()
        let dataManager = HomeDataManager(session: session)
        
        do {
            _ = try await dataManager.getCharacters()
            XCTAssertTrue(dataManager.offset == 11, "Error! Offset is not equal to 11")
        } catch {
            XCTFail("Expected data, but failed \(error).")
        }
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
