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
