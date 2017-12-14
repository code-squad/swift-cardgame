//
//  CardDeck.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 14..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

public struct CardDeck {
    private let cards: [Card]
    
    init(_ cards: [Card]) {
        self.cards = cards
    }
    
    public func count() -> Int {
        return self.cards.count
    }
    
    public static func reset() -> CardDeck {
        return makeCards()
    }
}

extension CardDeck {
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
    
    subscript(_ index: Int) -> Card {
        return self.cards[index]
    }
}
