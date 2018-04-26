//
//  CardDeck.swift
//  CardGame
//
//  Created by 김수현 on 2018. 4. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct CardDeck: OutputPrintable {
    
    private var cards = [Card]()
    private var pickCards = [Card]()
    
    init() {
        for suit in Card.Suit.suits {
            for rank in Card.Rank.ranks {
                self.cards.append(Card.init(suit, rank))
            }
        }
    }
    
    func count() -> Int {
        return self.cards.count
    }
    
    mutating func shuffle() -> [Card] {
        for i in 0..<cards.count {
            let randomCard: UInt32 = arc4random_uniform(UInt32(cards.count-1))
            let j = Int(randomCard)
            guard i != j else { continue }
            self.cards.swapAt(i, j)
        }
        return self.cards
    }
    
    mutating func removeOne() -> (basic: [Card], pick: Card) {
        let randomCard: UInt32 = arc4random_uniform(UInt32(cards.count-1))
        let removeCard = self.cards.remove(at: Int(randomCard))
        pickCards.append(removeCard)
        return (self.cards, removeCard)
    }
    
    mutating func reset() -> [Card] {
        self.cards = CardDeck().cards
        return self.cards
    }
    
    func countOfCards() -> String {
        return "\(self.cards.count)장"
    }
    
}
