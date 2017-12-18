//
//  CardDeck.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 14..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

public struct CardDeck {
    private var cards: [Card] = []
    
    init() {
        reset()
    }
    
    private mutating func makeCards() {
        self.cards = []
        
        for suit in Suit.values {
            for number in Number.values {
                self.cards.append(makeCard(suit, number))
            }
        }
    }
    
    private mutating func makeCard(_ suit: Suit, _ number: Number) -> Card {
        return Card(suit, number)
    }
    
    private func generateRandomInt() -> Int {
        return Int(arc4random_uniform(UInt32(cards.count)))
    }
    
    private mutating func removeCard() -> Card {
        return self.cards.remove(at: generateRandomInt())
    }
    
    private mutating func shuffleCards() {
        self.cards.shuffle()
    }
}

extension CardDeck {
    public mutating func reset() {
        makeCards()
    }
    
    public func count() -> Int {
        return self.cards.count
    }
    
    public mutating func removeOne() -> Card {
        return removeCard()
    }
    
    public mutating func suffle() {
        shuffleCards()
    }
    
    subscript(_ index: Int) -> Card {
        return self.cards[index]
    }
}

extension CardDeck: Equatable {
    public static func ==(lhs: CardDeck, rhs: CardDeck) -> Bool {
        guard lhs.cards == rhs.cards else {
            return false
        }
        
        return true
    }
}


extension Array {
    mutating func shuffle() {
        guard count > 1 else { return }
        
        for i in 0..<(count-1) {
            let j = Int(arc4random_uniform(UInt32(count-i))) + i
            guard i != j else { continue }
            
            self.swapAt(i, j)
        }
    }
}
