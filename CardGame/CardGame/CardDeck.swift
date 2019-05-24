//
//  CardDeck.swift
//  CardGame
//
//  Created by joon-ho kil on 5/21/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardDeck {
    private var cards = [Card]()
    
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
    
    /// 갖고 있는 카드 개수를 반환한다.
    func count() -> Int {
        return cards.count
    }
    
    /// 전체 카드를 랜덤하게 섞는다.
    mutating func shuffle () {
        cards = cards.shuffled()
    }
}
