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
        var count: UInt32 = UInt32(self.cards.count)
        for (index, value) in self.cards.reversed().enumerated() {
            defer { count -= 1 }
            let random = Int(arc4random_uniform(count))
            self.cards.swapAt(index, random)
        }
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
