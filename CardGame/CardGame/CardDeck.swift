//
//  CardDeck.swift
//  CardGame
//
//  Created by joon-ho kil on 5/21/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardDeck {
    var cards = [Card]()
    
    init() {
        for suit in Card.Suit.allCases {
            initSuit(suit: suit)
        }
    }
    
    /// 모양 별 초기화
    private mutating func initSuit (suit: Card.Suit) {
        for rank in Card.Rank.allCases {
            cards.append(Card(rank: rank, suit: suit))
        }
    }
}
