//
//  CardDeck.swift
//  CardGame
//
//  Created by BLU on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Deck {
    func shuffle()
    func reset()
    func removeOne() -> Card?
    func count() -> Int
}

struct CardDeck {
    private let cards: [Card]
}
