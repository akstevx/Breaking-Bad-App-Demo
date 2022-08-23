//
//  DetailViewModel.swift
//  BreakingBadApp
//
//  Created by Steven David on 23/08/2022.
//

import SwiftUI
import Foundation

class DetailViewModel: ObservableObject {
    @Published var showShimmer = true

    var id:Int
    @Published var detail: Character? = nil{
        didSet{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.getQuotes()
            }
        }
    }
    @Published var quotes: [Quote] = []

    init(id: Int){
        self.id = id
        getCharacterID()
    }
    
    func getCharacterID() {
        
        guard let url = URL(string: "\(NetworkHelper.baseUrl)characters/\(id)") else { fatalError("Missing URL") }

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
                        let decodedCharacter = try JSONDecoder().decode([Character].self, from: data)

                        self.detail = decodedCharacter.first
                        
                        print("CHARACTER IS --> \(self.detail)")

                    } catch let error {
                        self.showShimmer = false
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
    
    func getQuotes() {
        self.showShimmer = true
        guard let url = URL(string: "\(NetworkHelper.baseUrl)quote?author=\(self.catenateName())") else { fatalError("Missing URL") }

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
                        let decodedCharacter = try JSONDecoder().decode([Quote].self, from: data)
                        
                        self.quotes.append(contentsOf: decodedCharacter.prefix(5))
                        
                        print("CHARACTER QUOTE FETCHED --> \(decodedCharacter)")

                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
    
    func catenateName()-> String{
        if let character = detail{
            let fullNameArr = character.name.components(separatedBy: " ")
            let firstName = fullNameArr[0] //First
            let lastName = fullNameArr[1] //Last
                        
            return "\(firstName)+\(lastName)"
        }
        
        return ""
    }
    
}

