//
//  CardDeck.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 14..
//  Copyright © 2017년 YUAMING. All rights reserved.
//

import Foundation

struct Deck {
    private var cards: [Card] = []
    
    init() {
        reset()
    }

    mutating func reset() {
        resetCards()
    }
    
    var count: Int {
        return cards.count
    }
    
    var isAvailable: Bool {
        return self.count > 0
    }
    
    mutating func remove() throws -> Card {
        guard self.count > 0 else {
            throw GameError.notEnoughCards
        }
        
        return removeCard()
    }
    
    mutating func shuffle() {
        shuffleCards()
    }
}

private extension Deck {
    private mutating func resetCards() {
        self.cards = []
        
        for suit in Suit.allValues {
            for number in Number.allValues {
                self.cards.append(setCard(suit, number))
            }
        }
    }
    
    private mutating func setCard(_ suit: Suit, _ number: Number) -> Card {
        return Card(suit: suit, number: number)
    }
    
    private func generateRandomInt() -> Int {
        return Int(arc4random_uniform(UInt32(cards.count)))
    }
    
    private mutating func removeCard() -> Card {
        return self.cards.remove(at: generateRandomInt())
    }
    
    private mutating func shuffleCards() {
        self.cards = self.cards.shuffle()
    }
}

extension Deck: Equatable {
    static func ==(lhs: Deck, rhs: Deck) -> Bool {
        guard lhs.cards == rhs.cards else { return false }
        
        return true
    }
}

extension Array {
    func shuffle() -> Array {
        var array = self
        guard count > 1 else { return array }
        
        for i in 0..<(count-1) {
            let j = Int(arc4random_uniform(UInt32(count-i))) + i
            guard i != j else { continue }
            
            array.swapAt(i, j)
        }
        
        return array
    }
}
