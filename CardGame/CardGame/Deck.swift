//
//  Deck.swift
//  CardGame
//
//  Created by 심 승민 on 2017. 11. 28..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct Deck {
    private var cards: [Card]!
    init() {
        self.reset()
    }
    var count: Int {
        return self.cards.count
    }
    
    mutating func shuffle() {
        guard let shuffledCards = self.cards.shuffle() else { return }
        self.cards = shuffledCards
    }
    
    mutating func removeOne() -> Card? {
        guard cards.count > 0 else { return nil }
        return cards.popLast()
    }

    mutating func reset() {
        // 모든 카드 초기화
        var temp: [Card] = []
        let shapes = Shape.allValues
        let numbers = Number.allValues
        for shape in shapes {
            for number in numbers {
                temp.append(Card(shape, number))
            }
        }
        self.cards = temp
    }
    
}
