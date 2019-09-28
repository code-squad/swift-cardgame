//
//  CardDeck.swift
//  CardGame
//
//  Created by junwoo on 2019/09/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardDeck {
    private let defaultCards: [Card]
    private var cards: [Card]
    
    init(_ cards: [Card]) {
        defaultCards = cards
        self.cards = defaultCards
    }
    
    func count() -> Int {
        return cards.count
    }
    
    mutating func randomShuffle() {
        cards.shuffle()
    }
    
    mutating func removeOne() -> Card {
        return cards.removeLast()
    }
    
    mutating func reset() {
        cards = defaultCards
    }
}
