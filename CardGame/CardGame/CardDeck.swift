//
//  CardDeck.swift
//  CardGame
//
//  Created by jack on 2018. 1. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct CardDeck {
    private var deck : [Card] = []
    
    init() {
        for oneSuit in Card.Suits.allCases {
            for oneRank in Card.Ranks.allCases {
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
    
    mutating func generateStacks(_ maxCount : Int = 7) -> [[Card]] {
        var stacksOfCards : [[Card]] = []
        for count in 1...maxCount {
            stacksOfCards.append(generateOneStack(numberOfStack: count))
        }
        return stacksOfCards
    }
    
    private mutating func generateOneStack(numberOfStack : Int) -> [Card] {
        var oneStack : [Card] = []
        for _ in 1...numberOfStack {
            oneStack.append(self.removeOne())
        }
        return oneStack
    }
    
}
