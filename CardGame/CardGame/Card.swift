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
    var shape: Shape
    var number: Number
    init(_ shape: Shape, _ number: Number) {
        self.shape = shape
        self.number = number
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return self.shape.description + self.number.description
    }

}
