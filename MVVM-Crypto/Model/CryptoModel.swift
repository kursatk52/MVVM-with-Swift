//
//  CryptoModel.swift
//  MVVM-Crypto
//
//  Created by Kursat Korkmaz on 9.01.2023.
//

import Foundation



struct CryptoModel : Codable{
    let data : CryptoNestedData
    
    enum CodingKeys: String,CodingKey{
        case data
    }
}

struct CryptoNestedData : Codable{
    var symbol : String
    var buy : String
    var sell : String
    var high : String
    var averagePrice : String
    var low : String
    
    enum CodingKeys: String,CodingKey{
        case symbol
        case buy
        case sell
        case high
        case averagePrice
        case low
    }
}

