//
//  DeckMaker.swift
//  CardGame
//
//  Created by CHOMINJI on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct DeckMaker {
    static func makeCards() -> [Card] {
        var cards: [Card] = []
        let suits = Card.Suit.allCases
        let ranks = Card.Rank.allCases
        for suit in suits {
            for rank in ranks {
                let card = Card(suit: suit, rank: rank)
                cards.append(card)
            }
        }
        return cards
    }
}
