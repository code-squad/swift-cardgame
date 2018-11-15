//
//  CardDeck.swift
//  CardGame
//
//  Created by 윤지영 on 13/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct CardDeck: Playable {
    private var cards: [Card] = []

    init() {
        reset()
    }

    private mutating func fill() {
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                self.cards.append(Card(suit: suit, rank: rank))
            }
        }
    }

    var isEmpty: Bool {
        return cards.isEmpty
    }

    func count() -> Int {
        return cards.count
    }

    mutating func removeOne() -> Card {
        return cards.removeFirst()
    }

    mutating func removeMultiple(by number: Int) -> CardStack {
        var cardsRemoved: [Card] = []
        for _ in 0..<number {
            cardsRemoved.append(removeOne())
        }
        return CardStack.init(cards: cardsRemoved)
    }

    mutating func shuffle() {
        cards.shuffle()
    }

    mutating func reset() {
        cards.removeAll()
        fill()
        shuffle()
    }

    mutating func makeResult(of menu: MenuItem) -> String {
        switch menu {
        case .reset:
            reset()
            return "카드 전체를 초기화했습니다."
        case .shuffle:
            shuffle()
            return "전체 \(self.count())장의 카드를 섞었습니다."
        case .draw:
            let card = removeOne()
            return "\(card)\n총 \(self.count())장의 카드가 남아있습니다."
        case .quit:
            return "---- END ----"
        }
    }

}
