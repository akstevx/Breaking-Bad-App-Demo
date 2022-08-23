//
//  Quote.swift
//  BreakingBadApp
//
//  Created by Steven David on 22/08/2022.
//

import Foundation



struct Quote: Codable{
    let quote_id: Int
    let quote: String
    let author:String
    var series: String = ""
}
