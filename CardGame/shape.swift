//
//  card.swift
//  swift-cardgame
//
//  Created by Jin Hyung Park on 10/26/19.
//

import Foundation

enum Shape: Character {
    case spades = "♠️", hearts = "♥️", diamonds = "♦️", clubs = "♣️"
    var description: String {
        switch self {
        case .spades: return "♠️"
        case .hearts: return "♥️"
        case .clubs: return "♣️"
        case .diamonds: return "♦️"
        }
    }
}

//end of code
