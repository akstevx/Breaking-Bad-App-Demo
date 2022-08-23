//
//  Character.swift
//  BreakingBadApp
//
//  Created by Steven David on 22/08/2022.
//

import Foundation


struct Character: Codable{
    let char_id: Int, name: String, nickname: String
    let status: String, portrayed: String, category: String
    let birthday:String, img: String?
    let better_call_saul_appearance:[Int]?, occupation: [String]
    let appearance: [Int]
}

let dummyCharacter = Character(char_id: 1, name: "Skyler White", nickname: "Anna Gunn", status: "Alive", portrayed: "Anna Gunn", category: "Breaking Bad", birthday: "08-11-1970", img: "https://s-i.huffpost.com/gen/1317262/images/o-ANNA-GUNN-facebook.jpg", better_call_saul_appearance: [], occupation: ["House wife"], appearance: [1,2,3,4,5])
