//
//  CardFactory.swift
//  CardGame
//
//  Created by Daheen Lee on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

// 전체 Card 인스턴스 생성 담당
struct CardFactory {
    static func makeAllCards() -> [Card] {
        var cards = [Card]()
        for rank in Card.Rank.allCases {
            for suit in Card.Suit.allCases {
                cards.append(Card(rank, of: suit))
            }
        }
        return cards
    }
}
