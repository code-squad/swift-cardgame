//
//  CardHolder.swift
//  CardGame
//
//  Created by sungchan.you on 2019/09/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardHolder {
    static func allCards() -> [Card] {
        var cards: [Card] = []
        Card.Rank.allCases.forEach{ rank in
            Card.Suite.allCases.forEach{ suit in
                let card = Card(rank: rank, suite: suit)
                cards.append(card)
            }
        }
        return cards
    }
}
