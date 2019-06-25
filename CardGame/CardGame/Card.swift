//
//  Card.swift
//  CardGame
//
//  Created by CHOMINJI on 25/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Card {
    
    let suit: Suit
    let rank: Rank
    
    enum Suit: String, CustomStringConvertible {
        case hearts = "❤️"
        case diamonds = "♦️"
        case spades = "♠️"
        case clubs = "♣️"
        
        var description: String {
            return rawValue
        }
    }
    
    enum Rank: Int, CustomStringConvertible {
        case ace = 1
        case two, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king
        
        var description: String {
            switch self {
            case .ace:
                return "A"
            case .jack:
                return "J"
            case .queen:
                return "Q"
            case .king:
                return "K"
            default:
                return "\(rawValue)"
            }
        }
    }
    
    init?(suit: String, rank: Int) {
        guard let suit = Suit.init(suit),
            let rank = Rank.init(rawValue: rank) else {
                return nil
        }
        self.suit = suit
        self.rank = rank
    }
}

extension Card.Suit {
    init?(_ suit: String) {
        switch suit {
        case "hearts", "heart":
            self = .hearts
        case "diamonds", "diamond":
            self = .diamonds
        case "spades", "spade":
            self = .spades
        case "clubs", "club":
            self = .clubs
        default: return nil
        }
    }
}
