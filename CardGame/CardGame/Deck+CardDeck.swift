//
//  Deck+CardDeck.swift
//  CardGame
//
//  Created by BLU on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Deck {
    mutating func shuffle()
    mutating func reset()
    mutating func removeOne() -> Card?
    func count() -> Int
}

struct CardDeck: Deck {
    private var cards = [Card]()
    
    init() {
        self.reset()
    }
    
    mutating func shuffle() {
        self.cards.shuffle()
    }
    
    mutating func reset() {
        self.cards = CardFactory.makeCards()
        self.shuffle()
    }
    
    mutating func removeOne() -> Card? {
        return cards.popLast()
    }
    
    func count() -> Int {
        return cards.count
    }
}
