//
//  CardDeck.swift
//  CardGame
//
//  Created by Daheen Lee on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardDeck {
    private var cards = [Card]()
    
    init() {
        self.cards = CardFactory.makeAllCards()
    }
    
    mutating func reset() {
        self.cards = CardFactory.makeAllCards()
    }
    
    func count() -> Int {
        return cards.count
    }
    
    mutating func shuffle() {
        for i in 0..<cards.count - 1 {
            let randomIndex = Int.random(in: i..<cards.count)
            let temp = cards[i]
            cards[i] = cards[randomIndex]
            cards[randomIndex] = temp
        }
    }
    
    mutating func removeOne() -> Card {
        let randomIndex = Int.random(in: 0..<cards.count)
        let removedCard = cards.remove(at: randomIndex)
        return removedCard
    }
}
