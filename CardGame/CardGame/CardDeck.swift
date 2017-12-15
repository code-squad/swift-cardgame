//
//  CardDeck.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 14..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

public struct CardDeck {
    private var cards: [Card]
    
    init(_ cards: [Card]) {
        self.cards = cards
    }
    
    private static func makeCards() -> CardDeck {
        var cards: [Card] = []
        
        for suit in Suit.values {
            for number in Number.values {
                cards.append(makeCard(suit, number))
            }
        }
        
        return CardDeck(cards)
    }
    
    private static func makeCard(_ suit: Suit, _ number: Number) -> Card {
        return Card(suit, number)
    }
    
    private func generateRandomInt() -> Int {
        return Int(arc4random_uniform(UInt32(cards.count)))
    }
    
    private mutating func removeCard() -> Card {
        return self.cards.remove(at: generateRandomInt())
    }
    
    func sort() -> CardDeck {
        return CardDeck(self.cards.sorted(by: <))
    }
}

extension CardDeck {
    public static func reset() -> CardDeck {
        return makeCards()
    }
    
    public func count() -> Int {
        return self.cards.count
    }
    
    public mutating func removeOne() -> Card {
        return removeCard()
    }
    
    subscript(_ index: Int) -> Card {
        return self.cards[index]
    }
}

extension CardDeck: Equatable {
    public static func ==(lhs: CardDeck, rhs: CardDeck) -> Bool {
        print("a: \(lhs.cards)")
        print("b: \(rhs.cards)")
        guard lhs.cards == rhs.cards else {
            return false
        }
        
        return true
    }
}
