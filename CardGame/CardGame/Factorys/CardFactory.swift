//
//  CardFactory.swift
//  CardGame
//
//  Created by 이동영 on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardFactory: Factory {
    typealias IN = (Card.Suit,Card.Rank)
    typealias OUT = Card
    
    static func create(_ input: (Card.Suit, Card.Rank)) -> Card? {
        let (suit,rank) = input
        return Card.init(suit: suit, rank: rank)
    }
    
    static func createAll() -> [Card] {
        let suits = Card.Suit.allCases
        let ranks = Card.Rank.allCases
        var cards = [Card?]()
        
        for suit in suits {
            for rank in ranks {
                let input = (suit,rank)
                let card = create(input)
                cards.append(card)
            }
        }
        return cards.compactMap { $0 }
    }
    
}
