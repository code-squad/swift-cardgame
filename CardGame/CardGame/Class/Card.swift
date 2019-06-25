//
//  Card.swift
//  CardGame
//
//  Created by 이동영 on 25/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Card: CustomStringConvertible {
    private let suit: Suit
    private let rank: Rank
    
    var description: String {
        return "\(suit)\(rank)"
    }
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    init?(suit: Character, rank: Int) {
        guard let suit = Suit(rawValue: suit), let rank = Rank(rawValue: rank) else {
            return nil
        }
        self.suit = suit
        self.rank = rank
    }

}
// - MARK: - Nested Enum (Suit, Rank)
extension Card {
    enum Suit: Character, CustomStringConvertible {
        case spades = "♠️"
        case hearts = "♥️"
        case diamonds = "♦️"
        case clubs = "♣️"
        
        var description: String {
            return "\(rawValue)"
        }
        
    }
    
    enum Rank: Int, CustomStringConvertible,CaseIterable {
        case ace = 1
        case two,three,four,five,six,seven,eight,nine,ten
        case jack,queen,king
        
        var description: String {
            switch self {
            case .ace:
                return "A"
            case .two,.three,.four,.five,.six,.seven,.eight,.nine,.ten:
                return "\(rawValue)"
            case .jack:
                return "J"
            case .queen:
                return "Q"
            case .king:
                return "K"
            }
        }
    }
    
}
