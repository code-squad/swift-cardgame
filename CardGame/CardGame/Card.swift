//
//  Card.swift
//  CardGame
//
//  Created by RENO1 on 25/09/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Card: CustomStringConvertible {
    private let shape: Shape
    private let cardNumber: CardNumber
    
    var description: String {
        return "\(self.shape.rawValue)\(self.cardNumber.description)"
    }
    
    init(shape:Shape, cardNumber:CardNumber) {
        self.shape = shape
        self.cardNumber = cardNumber
    }
    
}

enum Shape:String {
    case Spades = "♠︎"
    case Clubs = "♣︎"
    case Hearts = "♥︎"
    case Diamonds = "♦︎"
}

enum CardNumber:Int, CustomStringConvertible {
    case one
    case two,three,four,five,six,seven,eight,nine,ten
    case eleven
    case twelve
    case thirteen
    
    var description: String {
        switch self {
        case .one:
            return "A"
        case .eleven:
            return "J"
        case .twelve:
            return "Q"
        case .thirteen:
            return "K"
        default:
            return String(rawValue)
        }
    }
}
