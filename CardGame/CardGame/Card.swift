//
//  Card.swift
//  CardGame
//
//  Created by 이진영 on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Card: CustomStringConvertible {
    private let suit: Suit
    private let rank: Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    var description: String {
        return "\(suit)\(rank)"
    }
}

//Suit와 Rank는 범위가 제한적이기 때문에 enum 사용
//Suit와 Rank 열거형은 Card 내부에서만 사용되기 때문에 nested enum 사용
extension Card {
    enum Suit: Character, CustomStringConvertible {
        case clubs = "\u{2633}" // ♣️
        case diamonds = "\u{2666}" // ♦️
        case hearts = "\u{2665}" // ♥️
        case spades = "\u{2660}" // ♠️
        
        var description: String {
            return String(rawValue)
        }
    }
    
    enum Rank: Int, CustomStringConvertible {
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
        
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
                return String(rawValue)
            }
        }
    }
}
