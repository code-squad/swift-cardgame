//
//  Card.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 14..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

enum Suit {
    case heart, diamond, club, spade
    
    static var values: [Suit] {
        return [.club, .diamond, .heart, .spade]
    }
}

extension Suit: Comparable {
    static func <(lhs: Suit, rhs: Suit) -> Bool {
        switch (lhs, rhs) {
        case (_, _) where lhs == rhs:
            return false
        case (.spade, _),
             (.heart, .diamond), (.heart, .club),
             (.diamond, .club):
            return false
        default:
            return true
        }
    }
}

extension Suit: CustomStringConvertible {
    var description: String {
        switch self {
        case .heart:
            return "♥️"
        case .diamond:
            return "♦️"
        case .club:
            return "♣️"
        case .spade:
            return "♠️"
        }
    }
}


