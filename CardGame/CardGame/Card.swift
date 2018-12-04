//
//  Space.swift
//  CardGame
//
//  Created by 윤동민 on 04/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Card {
    enum Shape : CustomStringConvertible {
        var description: String {
            switch self {
            case .spade:
                return "♠️"
            case .clover:
                return "♣️"
            case .heart:
                return "♥️"
            case .diamond:
                return "♦️"
            }
        }
        case spade
        case clover
        case heart
        case diamond
    }
    enum Number : Int, CustomStringConvertible {
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
                return "\(self.rawValue)"
            }
        }
        case one = 1
        case two = 2
        case three = 3
        case four = 4
        case five = 5
        case six = 6
        case seven = 7
        case eight = 8
        case nine = 9
        case ten = 10
        case eleven = 11
        case twelve = 12
        case thirteen = 13
    }
    
    private(set) var shape : Shape
    private(set) var number : Number
    
    init(shape : Shape, number : Number) {
        self.shape = shape
        self.number = number
    }
}

// CustomStringConvertible 프로토콜 채택 -> 인스턴스의 고유 String 표현법으로 만들 수 있다.
extension Card : CustomStringConvertible {
    var description: String {
        return "\(shape)\(number)"
    }
}
