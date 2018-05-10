//
//  CardDeck.swift
//  CardGame
//
//  Created by moon on 2018. 5. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct CardDeck {
    private var cardDeck: Deck = Deck()
    
    mutating func resetCard() {
        self.cardDeck = Deck()
    }
    
    mutating func shuffleCard() {
        var shuffledCards = [Card]()
        for count in stride(from: UInt32(self.cardDeck.cards.count), to: 0, by: -1) {
            shuffledCards.append(self.cardDeck.cards.remove(at: Int(arc4random_uniform(count))))
        }
        self.cardDeck.cards = shuffledCards
    }
    
    mutating func removeOneCard() -> Card? {
        return self.cardDeck.cards.popLast()
    }
    
    mutating func remove(numberOfCards: Int) -> [Card] {
        var removedCards: [Card] = [Card]()
        [0..<numberOfCards].forEach { _ in
            if let removedCard = self.cardDeck.cards.popLast() {
                removedCards.append(removedCard)
            }
        }
        return removedCards
    }
}

fileprivate struct Deck {
    var cards: [Card]
    
    init() {
        var cards: [Card] = [Card]()
        for suit in Card.Suit.allCases {
            for number in Card.Number.allCases {
                cards.append(Card(suit: suit, number: number))
            }
        }
        self.cards = cards
    }
}
