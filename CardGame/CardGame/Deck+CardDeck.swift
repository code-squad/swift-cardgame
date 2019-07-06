//
//  Deck+CardDeck.swift
//  CardGame
//
//  Created by BLU on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Deck {
    func shuffle()
    func reset()
    func removeOne() -> Card?
    func count() -> Int
}

class CardDeck: Deck {
    private var cards = [Card]()
    
    init() {
        self.reset()
    }
    
    func shuffle() {
        self.cards.shuffle()
    }
    
    func reset() {
        self.cards = CardGenerator.generateCards()
        self.shuffle()
    }
    
    func removeOne() -> Card? {
        return cards.popLast()
    }
    
    func count() -> Int {
        return cards.count
    }
}
