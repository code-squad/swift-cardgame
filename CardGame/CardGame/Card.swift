//
//  Card.swift
//  CardGame
//
//  Created by junwoo on 2019/09/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Card {
    let shape: Shape
    let number: Number
    
    //경우의 수로 표현가능하므로 enum 을 사용함
    enum Shape: String {
        case heart = "♥️"
        case clova = "♣️"
        case spade = "♠️"
        case diamond = "♦️"
    }
    
    enum Number: Int {
        case one = 1
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        case ten
        case eleven
        case twelve
        case thirteen
    }
    
    init(shape: Shape, number: Number) {
        self.shape = shape
        self.number = number
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        let convertedNumber = CardConverter.getCardString(number: number)
        return "\(shape.rawValue)\(convertedNumber)"
    }
}
