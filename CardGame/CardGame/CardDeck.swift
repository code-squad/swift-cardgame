//
//  CardDeck.swift
//  CardGame
//
//  Created by 김수현 on 2018. 4. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct CardDeck {
    
    var card = [Card]()
    
    init() {
        for suit in Card.Suit.suits {
            for rank in Card.Rank.ranks {
                self.card.append(Card.init(suit, rank))
            }
        }
    }
    
    func count() -> Int {
        return self.card.count
    }
    
    mutating func shuffle() {
        for i in 0..<card.count {
            let randomCard: UInt32 = arc4random_uniform(UInt32(card.count-1))
            let j = Int(randomCard)
            guard i != j else { continue }
            self.card.swapAt(i, j)
        }
    }
    
    mutating func removeOne() -> (basic: [Card], pick: [Card]) {
        var pickCard: [Card] = []
        let randomCard: UInt32 = arc4random_uniform(UInt32(card.count-1))
        pickCard.append(self.card.remove(at: Int(randomCard)))
        return (self.card, basic)
    }
    
    mutating func reset() {
        self.card = CardDeck().card
    }
    
}
