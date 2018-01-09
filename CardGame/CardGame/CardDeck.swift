//
//  CardDeck.swift
//  CardGame
//
//  Created by jack on 2018. 1. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct CardDeck {
    private(set) var deck : [Card] = []
    
    init() {
        for oneSuit in Card.Suits.allSuit {
            for oneRank in Card.Ranks.allRank {
                self.deck.append(Card(oneSuit, oneRank))
            }
        }
    }
    
    func count() -> Int {
        return self.deck.count
    }
    
    mutating func shuffle() {
        for _ in 0..<self.deck.count {
            do {
                self.deck.sort { (_,_) in arc4random() < arc4random() }
            }
        }
    }
    
    mutating func removeOne() -> Card {
        return self.deck.removeLast()
    }
    
    mutating func reset() {
        self.deck = CardDeck().deck
    }
}
