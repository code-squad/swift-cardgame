//
//  Deck.swift
//  CardGame
//
//  Created by Mrlee on 2017. 12. 4..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct Deck {
    private var cards = [Card]()
    
    func count() -> Int {
        return cards.count
    }
    
    mutating func reset() {
        self.cards = [Card]()
        for kindOfSuit in 0..<Card.Suit.allValues.count {
            for kindOfRank in 0..<Card.Rank.allValues.count {
               cards.append(Card(suit: kindOfSuit, rank: kindOfRank))
            }
        }
    }
    
    mutating func removeOne() -> Card? {
        return self.cards.popLast()
    }
    
    // func shuffle() {}
}
