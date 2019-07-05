//
//  CardFactory.swift
//  CardGame
//
//  Created by BLU on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGenerator {
    
    static func generateCards() -> [Card] {
        let deck = Card.Suit.allCases.flatMap { suit in
            Card.Rank.allCases.map { rank in
                Card(suit: suit, rank: rank)
            }
        }
        return deck
    }
}
