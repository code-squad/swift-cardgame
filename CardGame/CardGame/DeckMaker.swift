//
//  CardDeck.swift
//  CardGame
//
//  Created by JieunKim on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct DeckMaker {
    static func makeCard() -> [Card] {
        var cards: [Card] = []
        let suits = Card.Suits.allCases
        let ranks = Card.Ranks.allCases
        
        for suit in suits {
            for rank in ranks {
                let card = Card(suit: suit, rank: rank)
                cards.append(card)
            }
        }
        return cards
    }
}



