//
//  CardFactory.swift
//  CardGame
//
//  Created by BLU on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardFactory {
    
    static func makeCards() -> [Card] {
        var cards = [Card]()
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases {
                let card = Card(suit: suit, rank: rank)
                cards.append(card)
            }
        }
        return cards
    }
}
