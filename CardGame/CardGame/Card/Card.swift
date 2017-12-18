//
//  Card.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 14..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

public class Card {
    private let suit: Suit
    private let number: Number
    
    init(_ suit: Suit, _ number: Number) {
        self.suit = suit
        self.number = number
    }
    
    var description: String {
        return suit.description + number.description
    }
}

extension Card: Equatable, Comparable {
    public static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.suit == rhs.suit && lhs.number == rhs.number
    }
    
    public static func <(lhs: Card, rhs: Card) -> Bool {
        return lhs.number == rhs.number ? lhs.suit < rhs.suit : UInt8(lhs.number.rawValue) < UInt8(rhs.number.rawValue)
    }
}
