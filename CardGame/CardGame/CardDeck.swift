//
//  CardDeck.swift
//  CardGame
//
//  Created by 이동건 on 23/08/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct CardDeck {
    private var cards: [Card]
    
    var count: Int {
        return cards.count
    }
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    mutating func shuffle() {
        let startIndex = 0
        let endIndex = cards.count - 1
        if count < 2 { return }
        
        for i in startIndex ... endIndex {
            let j = Int(arc4random_uniform(UInt32(endIndex - i))) + i
            if i != j {
                cards.swapAt(i, j)
            }
        }
    }
    
    mutating func removeOne() -> Card {
        let randomIndex = Int(arc4random_uniform(UInt32(count - 1)))
        let pickedCard = cards.remove(at: randomIndex)
        return pickedCard
    }
    
    mutating func reset(with cards: [Card]) {
        self.cards = cards
    }
}
