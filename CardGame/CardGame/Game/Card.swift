//
//  Card.swift
//  CardGame
//
//  Created by 심 승민 on 2017. 11. 24..
//  Copyright © 2017년 심 승민. All rights reserved.
//

import Foundation

// Card = Rank + Suit
class Card {
    private let shape: Shape
    private let number: Number
    private var isFaceUp: Bool
    init(_ shape: Shape, _ number: Number) {
        self.shape = shape
        self.number = number
        // 디폴트는 false 지만, 현재 버전에서는 사용되지 않기 때문에 true로 둠.
        self.isFaceUp = true
    }
    deinit {
        // print("\(self.description): Card instance deinitialized.")
    }

    func showCard() -> (shape: Shape, number: Number)? {
        var facedUpCard: (Shape, Number)?
        if self.isFaceUp {
            facedUpCard = (self.shape, self.number)
        }else {
            facedUpCard = nil
        }
        return facedUpCard
    }

    // 숨겨져있는 카드를 보이도록 뒤집음.
    func turnOver() {
        if !isFaceUp {
            self.isFaceUp = true
        }
    }
}

// 카드 한 장 출력 포맷. 모양+숫자 형태.
extension Card: CustomStringConvertible {
    var description: String {
        return self.shape.description + self.number.description
    }

}

// 카드를 비교할 경우, 카드의 숫자를 비교. (Shape과 Number의 캡슐화를 위함.)
extension Card: Equatable, Comparable {
    static func ==(lhs: Card, rhs: Card) -> Bool {
        guard lhs.number == rhs.number else { return false }
        return true
    }

    static func <(lhs: Card, rhs: Card) -> Bool {
        guard lhs.number < rhs.number else { return false }
        return true
    }

}
