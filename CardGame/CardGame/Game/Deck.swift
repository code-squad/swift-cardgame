//
//  Deck.swift
//  CardGame
//
//  Created by 심 승민 on 2017. 11. 28..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct Deck {
    private var cards: CardStack!
    init() {
        self.reset()
    }
    var count: Int {
        return self.cards.count
    }
    var isEmpty: Bool {
        return self.cards.isEmpty
    }

    mutating func shuffle() {
        self.cards.shuffle()
    }

    mutating func removeOne() -> Card? {
        return self.cards.pop()
    }

    mutating func removeMany(selectedCount: Int) -> CardStack? {
        guard self.cards.count - selectedCount > 0 else { return nil }
        let cards: CardStack = CardStack()
        for _ in 0..<selectedCount {
            guard let popedCard = self.cards.pop() else { break }
            cards.push(card: popedCard)
        }
        return cards
    }

    mutating func reset() {
        // 모든 카드 초기화
        let aStackOfCards = CardStack()
        let shapes = Shape.allValues
        let numbers = Number.allValues
        for shape in shapes {
            for number in numbers {
                aStackOfCards.push(card: Card(shape, number))
            }
        }
        self.cards = aStackOfCards
    }

}
