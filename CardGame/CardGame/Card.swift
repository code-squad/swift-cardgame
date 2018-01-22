//
//  Card.swift
//  CardGame
//
//  Created by YOUTH on 2018. 1. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Card: CustomStringConvertible {
    private(set) var suit: CardDeck.Suit
    private(set) var denomination: CardDeck.Denomination
    var description: String {
        return self.suit.rawValue + self.denomination.description
    }
    
    init(suit: CardDeck.Suit, denomination: CardDeck.Denomination) {
        self.suit = suit
        self.denomination = denomination
        }
}


