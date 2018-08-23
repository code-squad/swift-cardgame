//
//  CardDeckGenerator.swift
//  CardGame
//
//  Created by 이동건 on 23/08/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct CardDeckGenerator {
    static func generateCards() -> [Card] {
        var cards: [Card] = []
        
        for symbol in Symbol.allCases {
            for number in Number.allCases {
                cards.append(Card(symbol: symbol, number: number))
            }
        }
        
        return cards
    }
}
