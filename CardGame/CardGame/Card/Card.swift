//
//  Card.swift
//  CardGame
//
//  Created by Elena on 23/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

// 카드에 숫자와 도형을 표현하고, 카드를 표현하는 문자열을 정의
class Card: CustomStringConvertible {
    private let number: Number
    private let shape: Shape
    
    init(number: Number, shape: Shape) {
        self.number = number
        self.shape = shape
    }
    
    var description: String {
        return "\(shape.rawValue)\(number.value)"
    }
}
