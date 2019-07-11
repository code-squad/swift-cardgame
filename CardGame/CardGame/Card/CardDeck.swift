//
//  CardDeck.swift
//  CardGame
//
//  Created by JieunKim on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Deck {
    mutating func count() -> Int
    mutating func reset()
    mutating func shuffle()
    mutating func removeOne() -> Card?
}

struct CardDeck: Deck {
    private var cards = [Card]()
    init() {
        reset()
    }
    
    mutating func count() -> Int {
        return cards.count
    }
    
    mutating func reset() {
        cards.removeAll()
        self.cards = CardMaker.makeCard()
    }
    
    mutating func shuffle() {
        cards = cards.shuffled()
    }
    
    mutating func removeOne() -> Card? {
        guard !cards.isEmpty else { return nil }
        return cards.popLast()
    }
}
