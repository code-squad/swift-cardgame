//
//  CardDeck.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardDeck: Deck {
    typealias T = Card
    var cards: [Card]!
    
    init() {
        self.reset()
    }
    
    func count() -> Int {
        return self.cards.count
    }
    
    mutating func removeOne() -> Card? {
        return cards[0]
    }
    
    mutating func shuffle() {
        self.cards.shuffle()
    }
    
    mutating func reset() {
        self.cards = Card.allCards()
        self.shuffle()
    }
    
}

extension CardDeck: Equatable {
    static func == (lhs: CardDeck, rhs: CardDeck) -> Bool {
        return lhs.count() == rhs.count()
    }
}
