//
//  CardDeck.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 14..
//  Copyright © 2017년 JK. All rights reserved.
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
    
    func count() -> Int {
        return cards.count
    }
    
    func isAvailable() -> Bool {
        return count() > 0
    }
    
    mutating func remove() throws -> Card {
        guard self.count() > 0 else {
            throw GameError.notEnoughCards
        }
        
        return removeCard()
    }
    
    mutating func shuffle() {
        shuffleCards()
    }
    
    subscript(_ index: Int) -> Card {
        return cards[index]
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
        return Card(suit, number)
    }
    
    private mutating func removeCard() -> Card {
        return self.cards.removeLast()
    }

    
    private mutating func shuffleCards() {
        self.cards = self.cards.shuffle()
    }
}

extension Deck: Equatable {
    static func ==(lhs: Deck, rhs: Deck) -> Bool {
        guard lhs.cards == rhs.cards else {
            return false
        }
        
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
