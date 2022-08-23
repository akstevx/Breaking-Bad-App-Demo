//
//  Death.swift
//  BreakingBadApp
//
//  Created by Steven David on 22/08/2022.
//

import Foundation

struct Death: Codable{
    let death_id: Int, death: String
    let cause:String, responsible: String
    let last_words: String
    var season: Int, episode: Int
    var number_of_deaths: Int
}

struct RandomDeath: Codable{
    let death_id: Int, death: String
    let cause:String, responsible: String
    let last_words: String
    var season: Int, episode: Int
    var occupation: [String]
    var img: String
    var nickname:String
    var appearance: [Int]
}


let death = RandomDeath(death_id: 1, death: "Mike Ehrmantraut", cause: "Shot in the gut.", responsible: "Walter White", last_words: "Shut the fuck up and let me die in peace.", season: 5, episode: 7, occupation: ["Hitman"," Private Investigator"," Ex-Cop"], img: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_mike-ehrmantraut-lg.jpg", nickname: "Mike", appearance: [1,2,3,4] )
