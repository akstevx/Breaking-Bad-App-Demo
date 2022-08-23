//
//  HomeViewModel.swift
//  BreakingBadApp
//
//  Created by Steven David on 22/08/2022.
//

import Foundation
import SwiftUI

class HomeViewModel : ObservableObject{
    @Published var showProgress = true
    @Published var openDetailView = false
    @Published var toggleFullScreen = false
    @Published var showShimmer = true

    @Published var searchList: [Character] = []
    @Published var characterList: [Character] = []{
        didSet{
            self.searchList = characterList
        }
    }
    
    @Published var isSearching = false

    @Published var randomQoutes: [Quote] = []
    @Published var searchString = ""{
        didSet{
            search()
        }
    }
    @Published var offset = 0
    @Published var limit = 10
    @Published var currentId = 0

    init(){
        self.getRandomQuote()
        self.getRandomQuote()
        self.getRandomQuote()
        
        self.getCharacters()
    }

    func getCharacters() {
        resetSearch()
        
        guard let url = URL(string: "\(NetworkHelper.baseUrl)characters?limit=\(limit)&offset=\(offset)") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self.showShimmer = false

                    do {
                        let decodedCharacters = try JSONDecoder().decode([Character].self, from: data)
                        if !decodedCharacters.isEmpty {
                            if decodedCharacters.count < 10 {
                                self.showProgress = false
                            }
                            
                            self.updateOffset()
                            self.characterList.append(contentsOf: decodedCharacters)
                            self.searchList.append(contentsOf: self.characterList)
                        }


                        print("CHARACTERS FETCHED -->\(decodedCharacters), \n CHARACTER LISTSIZE \(self.characterList.count)")
                    } catch let error {
                        self.showShimmer = false
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
    
    func getRandomQuote() {
        guard let url = URL(string: "\(NetworkHelper.baseUrl)quote/random") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }
            

            if response.statusCode == 200 {

                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedQuote = try JSONDecoder().decode([Quote].self, from: data)
                        if let  quote = decodedQuote.first{
                            if self.randomQoutes.count < 3 {
                                self.randomQoutes.append(quote)
                                
                                print("QUOTES FETCHED -->\(quote)")
                            }
                        }

                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
    
    private func search(){
        var currentCount = 0
        
        if searchString.isEmpty {
            resetSearch()
            return
        }
        
        if currentCount < searchString.count{
            resetSearch()
        }
        
        isSearching = true
        currentCount = searchString.count

        print("IS SEARCHINg")

        self.searchList = searchList.filter{ character in
            return character.name.contains(searchString) || character.category.contains(searchString) || character.status.contains(searchString)
        }
    }
    
    private func resetSearch(){
        isSearching = false
        searchList.removeAll()
        searchList.append(contentsOf: characterList)
    }
    
    private func updateOffset(){
        if self.offset == 0{
            self.offset = 11
            
            return
        }
        
        self.offset += 10
        return
    }
    
    func presentSheet(screenCoverCase: ScreenCoverCase) -> AnyView{
        switch screenCoverCase {
        case .Quote:
            return AnyView( QuoteView(onDismiss: {
                self.toogleSheet()
            }, onClick: { quote in
                self.moveToDetailView(id: quote.quote_id)
            }))
            
        case .Death:
            return AnyView(DeathView(onDismiss: {
                self.toogleSheet()
            }))
            
        }
    }
    
    func toogleSheet(){
        toggleFullScreen.toggle()
    }
    
    func moveToDetailView(id: Int){
        currentId = id
        self.openDetailView.toggle()
    }
    
    func getQuotes() -> Array<Quote>{
        let quotes = [
            Quote(quote_id: randomQoutes[0].quote_id, quote: randomQoutes[0].quote, author: randomQoutes[0].author),
            Quote(quote_id: randomQoutes[1].quote_id, quote: randomQoutes[1].quote, author: randomQoutes[1].author),
            Quote(quote_id: randomQoutes[2].quote_id, quote: randomQoutes[2].quote, author: randomQoutes[2].author)
        ]
        
        return quotes
    }
    
}

