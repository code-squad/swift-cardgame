//
//  CardDeck.swift
//  CardGame
//
//  Created by 윤지영 on 13/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct CardDeck: Playable {
    private var cards: [Card] = []

    init() {
        reset()
    }

    private mutating func fill() {
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                self.cards.append(Card(suit: suit, rank: rank))
            }
        }
    }

    func count() -> Int {
        return cards.count
    }

    mutating func shuffle() {
        cards.shuffle()
    }

    mutating func removeOne() -> Card {
        return cards.removeFirst()
    }

    mutating func reset() {
        cards.removeAll()
        fill()
        shuffle()
    }

}
