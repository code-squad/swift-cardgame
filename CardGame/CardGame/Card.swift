//
//  Card.swift
//  CardGame
//
//  Created by YOUTH on 2018. 1. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Card: CustomStringConvertible, Comparable, Hashable {
    var hashValue: Int {
        return denomination.rawValue
    }

    private var suit: CardDeck.Suit
    private var denomination: CardDeck.Denomination
    var description: String {
        return self.suit.rawValue + self.denomination.description
    }
    
    init(suit: CardDeck.Suit, denomination: CardDeck.Denomination) {
        self.suit = suit
        self.denomination = denomination
        }

    static func <(lhs: Card, rhs: Card) -> Bool {
        return lhs.denomination.rawValue < rhs.denomination.rawValue
    }

    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.denomination == rhs.denomination
    }

    func isContinuous(next: Card) -> Bool {
        return self.denomination.isContinuous(next: next.denomination)
    }

    func isSameSuit(next: Card) -> Bool {
        return self.suit == next.suit
    }

    func weightedScore() -> Int {
        return self.denomination.rawValue
    }

    func shape() -> CardDeck.Suit{
        return self.suit
    }

}


