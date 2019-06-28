//
//  DeckMaker.swift
//  CardGame
//
//  Created by CHOMINJI on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol DeckMakable {
    associatedtype Element
    static func makeElements() -> [Element]
}

struct DeckMaker: DeckMakable {
    typealias Element = Card
    
    static func makeElements() -> [Element] {
        var cards: [Element] = []
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
