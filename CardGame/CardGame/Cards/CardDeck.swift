//
//  CardDeck.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 14..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct CardDeck {
    private var cards: [Card] = []
    
    init() {
        reset()
    }
    
    init(_ cards: [Card]) {
        self.cards = cards
    }
    
    mutating func reset() {
        makeCards()
    }
    
    func count() -> Int {
        return cards.count
    }
    
    func isAvailable() -> Bool {
        return count() > 0
    }
    
    mutating func removeOne() -> Card {
        return removeCard()
    }
    
    mutating func removeCards(_ count: Int) -> CardStack {
        var cardStack: CardStack = CardStack()
        for _ in 0..<count {
            cardStack.pushCard(removeCard())
        }
        
        return cardStack
    }
    
    mutating func shuffle() {
        shuffleCards()
    }
    
    subscript(_ index: Int) -> Card {
        return cards[index]
    }
}

private extension CardDeck {
    private mutating func makeCards() {
        cards = []
        
        for suit in Suit.values {
            for number in Number.values {
                cards.append(makeCard(suit, number))
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
        return cards.remove(at: generateRandomInt())
    }

    
    private mutating func shuffleCards() {
        self.cards = cards.shuffle()
    }
}

extension CardDeck: Equatable {
    static func ==(lhs: CardDeck, rhs: CardDeck) -> Bool {
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
