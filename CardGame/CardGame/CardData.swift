//
//  CardData.swift
//  CardGame
//
//  Created by Eunjin Kim on 2017. 12. 20..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class CardData {
    // Nested enum 타입을 사용한 데이터 구조가 클래스보다 사용하기에 편리할 것 같아서 사용함.
    enum Shape: Int {
        case Spades = 1, Hearts, Diamonds, Clubs
        func getShape() -> String {
            switch self {
                case .Spades:
                    return UniCodeOfCardGame.shapeName.spades
                case .Hearts:
                    return UniCodeOfCardGame.shapeName.hearts
                case .Diamonds:
                    return UniCodeOfCardGame.shapeName.diamonds
                case .Clubs:
                    return UniCodeOfCardGame.shapeName.clubs
            }
        }
    }
    enum Number: Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Ace = 1, Jack = 11, Queen, King
        func getNumber() -> Character {
            switch self {
                case .Ace:
                    return "A"
                case .Jack:
                    return "J"
                case .Queen:
                    return "Q"
                case .King:
                    return "K"
                default: break
            }
            return " "
        }
    }
    
    func getCardData(shape: Int, number: Int) {
        let myShape = Shape(rawValue: shape)!
        let myNumber = Number(rawValue: number)!
        print(myShape.getShape(), number > 1 && number < 11 ? number : myNumber.getNumber())
        
    }
}
