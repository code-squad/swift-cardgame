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
    var pickCard = [Card]()
    
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
    
    mutating func shuffle() -> [Card] {
        for i in 0..<card.count {
            let randomCard: UInt32 = arc4random_uniform(UInt32(card.count-1))
            let j = Int(randomCard)
            guard i != j else { continue }
            self.card.swapAt(i, j)
        }
        return self.card
    }
    
    mutating func removeOne() -> (basic: [Card], pick: Card) {
        let randomCard: UInt32 = arc4random_uniform(UInt32(card.count-1))
        let removeCard = self.card.remove(at: Int(randomCard))
        pickCard.append(removeCard)
        return (self.card, removeCard)
    }
    
    mutating func reset() -> [Card] {
        self.card = CardDeck().card
        return self.card
    }
    
}
