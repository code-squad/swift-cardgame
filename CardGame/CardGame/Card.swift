//
//  Card.swift
//  CardGame
//
//  Created by moon on 2018. 5. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Card {
    // Nested enum을 선택한 이유 :
    // - 코드의 가독성을 위해 (Card의 suit, number의 프로퍼티 타입을 한 눈에 확인할 수 있다.)
    // - 현재로써는 Card에서만 사용하는 타입이므로 "Card의 Suit, Card의 Number"를 표현하기 위해
    // - Suit와 Number 모두 enum을 사용한 이유 - 카드게임에서 사용되는 모양과 숫자는 예상된 제한된 값
    enum Suit: CustomStringConvertible, CaseIterable {
        case clubs, diamonds, hearts, spades

        var description: String {
            switch self {
            case .clubs:
                return "♣️"
            case .diamonds:
                return "♦️"
            case .hearts:
                return "♥️"
            case .spades:
                return "♠️"
            }
        }
    }
    
    enum Number: Int, CustomStringConvertible, CaseIterable {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        
        var description: String {
            switch self {
            case .jack:
                return "J"
            case .queen:
                return "Q"
            case .king:
                return "K"
            case .ace:
                return "A"
            default:
                return String(self.rawValue)
            }
        }
    }
    
    private let suit: Suit
    private let number: Number
    
    init(suit: Suit, number: Number) {
        self.suit = suit
        self.number = number
    }
    
    func isSameSuit(_ suit: Suit) -> Bool {
        return self.suit == suit
    }
    
    func isSameNumber(_ number: Number) -> Bool {
        return self.number == number
    }
    
    func selectHigherNumber(_ card: Card) -> Number {
        var result: Number
        if self > card {
            result = self.number
        } else if self < card {
            result = card.number
        } else {
            result = self.number
        }
        return result
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return "\(self.suit)\(self.number)"
    }
}

extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.number.rawValue == rhs.number.rawValue
    }
}

extension Card: Comparable {
    static func < (lhs: Card, rhs: Card) -> Bool {
        return lhs.number.rawValue < rhs.number.rawValue
    }
    
    static func > (lhs: Card, rhs: Card) -> Bool {
        return lhs.number.rawValue > rhs.number.rawValue
    }
}
