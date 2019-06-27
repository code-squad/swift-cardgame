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
        self.cards = createAllCards()
    }
    
    mutating func reset() {
        self.cards = createAllCards()
    }
    
    private func createAllCards() -> [Card] {
        var cards = [Card]()
        for rank in Card.Rank.allCases {
            for suit in Card.Suit.allCases {
                cards.append(Card(rank, of: suit))
            }
        }
        return cards
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
    
    
}
