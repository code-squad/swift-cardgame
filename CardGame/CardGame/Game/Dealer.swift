//
//  Dealer.swift
//  CardGame
//
//  Created by 심 승민 on 2017. 11. 28..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct Dealer {
    private(set) var deck: Deck
    private(set) var cardStacks: [CardStack]
    init(deck: Deck) {
        self.deck = deck
        self.cardStacks = []
    }
    enum GameMenu: Int {
        case reset = 1
        case shuffle
        case remove
    }
    enum CardGameError: String, Error {
        case lackOfCards = "덱에 카드가 없습니다."
    }

    mutating func start(_ menu: GameMenu) throws -> Card? {
        switch menu {
        case .reset: self.deck.reset()
        case .shuffle: self.deck.shuffle()
        case .remove:
            guard let selectedCard = self.deck.removeOne() else { throw CardGameError.lackOfCards  }
            return selectedCard
        }
        return nil
    }

    mutating func setCardStack(of pileCount: Int) {
        var pileCount = pileCount
        for _ in 0..<pileCount {
            defer { pileCount -= 1 }
            guard let cardStack = self.deck.removeMany(selectedCount: pileCount) else { break }
            self.cardStacks.append(cardStack)
        }
    }

}
