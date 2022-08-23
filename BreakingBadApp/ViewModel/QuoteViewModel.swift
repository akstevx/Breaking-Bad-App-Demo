//
//  QuoteViewModel.swift
//  BreakingBadApp
//
//  Created by Steven David on 23/08/2022.
//

import Foundation

class QuoteViewModel : ObservableObject{
    @Published var showProgress = true
    @Published var isSearching = false
    @Published var searchList: [Quote] = []
    @Published var quoteListApi: [Quote] = []
    @Published var quoteList: [Quote] = []{
        didSet{
            self.searchList = quoteList
        }
    }
    @Published var randomQoutes: [Quote] = []
    @Published var searchString = ""{
        didSet{
            search()
        }
    }

    init(){
        self.getRandomQuote()
        self.getRandomQuote()
        self.getRandomQuote()
        
        self.getQuotes()
    }
    
    func getQuotes() {
        resetSearch()

        guard let url = URL(string: "\(NetworkHelper.baseUrl)quotes") else { fatalError("Missing URL") }

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

                        self.quoteList.append(contentsOf: decodedQuote.prefix(20))
                        self.searchList.append(contentsOf: self.quoteList)

                    } catch let error {
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

        self.searchList = searchList.filter{ quote in
            return quote.quote.contains(searchString) || quote.author.contains(searchString)
        }
    }
    
    private func resetSearch(){
        isSearching = false
        searchList.removeAll()
        searchList.append(contentsOf: quoteList)
    }
    
    func getRandomQuotes() -> Array<Quote>{
        let quotes = [
            Quote(quote_id: randomQoutes[0].quote_id, quote: randomQoutes[0].quote, author: randomQoutes[0].author),
            Quote(quote_id: randomQoutes[1].quote_id, quote: randomQoutes[1].quote, author: randomQoutes[1].author),
            Quote(quote_id: randomQoutes[2].quote_id, quote: randomQoutes[2].quote, author: randomQoutes[2].author)
        ]
        
        return quotes
    }
}
