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
        self.isFaceUp = false
    }
    deinit {
        // print("\(self.description): Card instance deinitialized.")
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return self.shape.description + self.number.description
    }

}
