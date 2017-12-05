//
//  CardStack.swift
//  CardGame
//
//  Created by 심 승민 on 2017. 11. 30..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class CardStack: Sequence {
    private var cards: [Card]
    let start: Int
    var count: Int {
        return self.cards.count
    }
    var isEmpty: Bool {
        return self.cards.isEmpty
    }
    init() {
        self.cards = []
        self.start = 0
    }

    func makeIterator() -> ClassIteratorOf<Card> {
        return ClassIteratorOf(self.cards)
    }
}

extension CardStack {

    func push(card: Card) {
        self.cards.append(card)
    }

    func pop() -> Card? {
        return self.cards.popLast()
    }

    func peek() -> Card? {
        return self.cards.last
    }

    func shuffle() {
        guard let shuffledCards = self.cards.shuffle() else { return }
        self.cards = shuffledCards
    }

    func reset() {
        self.cards = []
    }

}

extension CardStack: CustomStringConvertible {
    var description: String {
        var result = "["
        for card in self.cards {
            result += card.description + ", "
        }
        result.removeLast()
        result.removeLast()
        result += "]"
        return result
    }

}
