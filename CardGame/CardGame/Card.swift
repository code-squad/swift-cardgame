//
//  Space.swift
//  CardGame
//
//  Created by 윤동민 on 04/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Card {
    enum Shape : String {        // 범위 외의 값을 예외처리하기 쉬워진다. Enum은 또한 일급 클래스로 내부에 함수를 구현해 카드 정보를 출력할 때 편리하다.
        case spade = "♠️"
        case clover = "♣️"
        case heart = "♥️"
        case diamond = "♦️"
    }
    enum Number : Int {
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
        
        func returnString() -> String {
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
    }
    
    private(set) var shape : Shape
    private(set) var number : Number
    
    init(shape : Shape, number : Number) {
        self.shape = shape
        self.number = number
    }
    
    // 카드의 정보를 가져옴
    func getInformation() -> String {
        return "\(shape.rawValue)\(number.returnString())"
    }
}
