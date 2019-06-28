//
//  CardDeck.swift
//  CardGame
//
//  Created by CHOMINJI on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

    private var cards: [Card] = []
    
    var count: Int {
        return cards.count
    }
    
    init() {
        self.reset()
    }
    
    mutating func reset() {
        cards.removeAll()
        let suits = Card.Suit.allCases
        let ranks = Card.Rank.allCases
        for suit in suits {
            for rank in ranks {
                let card = Card(suit: suit, rank: rank)
                cards.append(card)
            }
        }
    }
    
    mutating func shuffle() {
        cards = cards.shuffled()
    }
    
    mutating func removeOne() -> Card? {
        guard let lastCard = cards.popLast() else {
            return nil
        }
        return lastCard
    }
}

}
