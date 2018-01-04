//
//  Card.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 14..
//  Copyright © 2017년 YUAMING. All rights reserved.
//

import Foundation

struct Card {
    private(set) var suit: Suit
    private(set) var number: Number
}

extension Card: Equatable, Comparable {
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.suit == rhs.suit && lhs.number == rhs.number
    }
    
    static func <(lhs: Card, rhs: Card) -> Bool {
        return lhs.number == rhs.number ? lhs.suit < rhs.suit : UInt8(lhs.number.rawValue) < UInt8(rhs.number.rawValue)
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return "\(suit.description)\(number.description)"
    }
}
