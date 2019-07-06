//
//  CardsInfo.swift
//  CardGame
//
//  Created by CHOMINJI on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardsInfo {
    private var cards: [Card]
    private var collectedCards: [Card: Int] = [:]
    private var hands: [Card: CardSetRanking] = [:]
    
    init(cards: [Card] = []) {
        self.cards = cards
    }
    
    mutating func makeHands() {
        self.collectedCards = cards.reduce(into: [:]) { counts, card in
            counts[card, default: 0] += 1
        }
        self.hands = HandDecider.decidePair(of: collectedCards)
        let straight =  HandDecider.decideStraight(of: collectedCards)
        if straight.isStraight, let max = straight.maxRank {
            hands[max] = .straight
        }
    }
    
    mutating func bestHand() -> (key: Card, value: CardSetRanking) {
        makeHands()
        var sortedHands = hands.sorted(by: { $0.value < $1.value })
        let maxHand = sortedHands[sortedHands.count - 1]
        return maxHand
    }
}
