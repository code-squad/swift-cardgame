//
//  Dealer.swift
//  CardGame
//
//  Created by 심 승민 on 2017. 11. 28..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct Dealer {
    enum GameMenu: Int {
        case reset = 1
        case shuffle
        case remove
    }
    enum CardGameError: String, Error {
        case lackOfCards = "덱에 카드가 없습니다."
    }

    static func start(_ menu: GameMenu, with deck: inout Deck) throws -> Card? {
        switch menu {
        case .reset: deck.reset()
        case .shuffle: deck.shuffle()
        case .remove:
            guard let selectedCard = deck.removeOne() else { throw CardGameError.lackOfCards  }
            return selectedCard
        }
        return nil
    }

}
