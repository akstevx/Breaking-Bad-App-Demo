//
//  DeathViewModel.swift
//  BreakingBadApp
//
//  Created by Steven David on 23/08/2022.
//

import Foundation

class DeathViewModel : ObservableObject{
    @Published var randomDeath: RandomDeath? = nil
    @Published var deadCharacterList: [Death]? = nil
    
    @Published var showRandomDeathShimmer = true
    @Published var showShimmer = true

    init(){
        getRandomDeath()
        getDeaths()
    }
    
    func getRandomDeath(){
        guard let url = URL(string: "\(NetworkHelper.baseUrl)random-death") else { fatalError("Missing URL") }
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
                    self.showRandomDeathShimmer = false
                    
                    do {
                        let decodedResponse = try JSONDecoder().decode(RandomDeath.self, from: data)
                        self.randomDeath = decodedResponse
                        print("RANDROM DEATH -->\(decodedResponse)")

                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
    
    func getDeaths(){
        guard let url = URL(string: "\(NetworkHelper.baseUrl)death") else { fatalError("Missing URL") }
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
                        let decodedResponse = try JSONDecoder().decode([Death].self, from: data)
                        self.deadCharacterList = decodedResponse
                        
                        print("DEATH LIST -->\(decodedResponse)")

                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
}
