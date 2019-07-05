//
//  Card.swift
//  CardGame
//
//  Created by CHOMINJI on 25/06/2019.
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

// 모양이나 숫자의 범위가 고정되어 있기 때문에 enum 사용
// 카드컨텍스트 안에서만 사용되기 때문에 nested enum으로 사용
extension Card {
    enum Suit: String, CustomStringConvertible, CaseIterable {
        case hearts = "❤️"
        case diamonds = "♦️"
        case spades = "♠️"
        case clubs = "♣️"
        
        var description: String {
            return rawValue
        }
    }
    
    enum Rank: Int, CustomStringConvertible, CaseIterable, Comparable {
        case ace = 1
        case two, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king
        
        var description: String {
            switch self {
            case .ace: return "A"
            case .jack: return "J"
            case .queen: return "Q"
            case .king: return "K"
            default: return "\(rawValue)"
            }
        }
        
        static func < (lhs: Card.Rank, rhs: Card.Rank) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
    }
}

extension Card: Comparable {
    static func < (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank < rhs.rank
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank == rhs.rank
    }
    
    static func == (lhs: Card, rhs: Int) -> Bool {
        return lhs.rank.rawValue == rhs
    }
    
    static func == (lhs: Int, rhs: Card) -> Bool {
        return lhs == rhs.rank.rawValue
    }
    
    static func + (lhs: Card, rhs: Int) -> Int {
        return lhs.rank.rawValue + rhs
    }
    static func + (lhs: Int, rhs: Card) -> Int {
        return lhs + rhs.rank.rawValue
    }
    
    func showRank() -> Card.Rank {
        return rank
    }
}

extension Card: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(rank)
    }
}
