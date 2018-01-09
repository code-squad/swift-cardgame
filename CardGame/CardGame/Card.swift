//
//  Card.swift
//  CardGame
//
//  Created by YOUTH on 2018. 1. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Card {
    var suit: CardDeck.Suit
    var denomination: CardDeck.Denomination
    
    init(suit: CardDeck.Suit, denomination: CardDeck.Denomination) {
        self.suit = suit
        self.denomination = denomination
    }
    
    func cardSuit() -> String {
        return self.suit.rawValue
    }
    
    func cardDenomination() -> String {
        return self.denomination.description
    }
}

