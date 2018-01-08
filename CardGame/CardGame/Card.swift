//
//  CardData.swift
//  CardGame
//
//  Created by Eunjin Kim on 2017. 12. 20..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Card: Comparable {
    var shape: Shape
    var number: Number
    
    // Nested enum 타입을 사용한 데이터 구조가 클래스보다 사용하기에 편리할 것 같아서 사용함.
    enum Shape: Int, CustomStringConvertible {
        case Spades = 1, Hearts, Diamonds, Clubs
        var description: String {
            switch self {
                case .Spades:
                    return "♠️"
                case .Clubs:
                    return "♣️"
                case .Hearts:
                    return "❤️"
                case .Diamonds:
                    return "♦️"
            }
        }
        static let kind = [Spades, Hearts, Diamonds, Clubs]
    }
    enum Number: Int, CustomStringConvertible {
        case Ace = 1, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
        var description: String {
            switch self {
                case .Ace:
                    return "A"
                case .Jack:
                    return "J"
                case .Queen:
                    return "Q"
                case .King:
                    return "K"
                default:
                    return "\(self.rawValue)"
            }
        }
        static let kind = [Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King]
    }
    
    init(shape: Shape, number: Number) {
        self.shape = shape
        self.number = number
    }
    
    func checkSameNumberCard(cardOfPlayer: Card) -> Bool {
        guard cardOfPlayer.number == self.number else {
            return false
        }
        return true
    }
    
    func compareSortCard(cardOfPlayer: Card) -> Bool {
        return (cardOfPlayer.number.rawValue - self.number.rawValue) == 1
    }
    
    func checkSameShapeCard(cardOfPlayer: Card) -> Bool {
        guard cardOfPlayer.shape == self.shape else {
            return false
        }
        return true
    }
    
    func plusPointCardData() -> Int {
        return self.number.rawValue * self.shape.rawValue
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.number == rhs.number
    }
    
    static func <(lhs: Card, rhs: Card) -> Bool {
        return lhs.number.rawValue < rhs.number.rawValue
    }

}

extension Card: CustomStringConvertible {
    var description: String {
        return self.shape.description + self.number.description
    }
}
