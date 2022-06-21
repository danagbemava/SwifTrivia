//
//  Difficulty.swift
//  SwifTrivia
//
//  Created by Daniel Agbemava on 21/06/2022.
//

import Foundation

enum Difficulty : String, Codable {
    
    case hard = "Hard"
    case medium = "Medium"
    case easy = "Easy"
    case unknown = "HardCore"
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let difficulty = try? container.decode(String.self)
        
        switch(difficulty) {
            case "hard": self = .hard
            case "easy": self = .easy
            case "medium": self = .medium
            default: self  = .unknown
        }
    }
}
