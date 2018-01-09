//
//  Card.swift
//  CardGame
//
//  Created by jack on 2018. 1. 6..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Card {
    private var suit : Suits, rank : Ranks
    
    init(_ suit : Suits  , _ rank : Ranks) {
        self.suit = suit
        self.rank = rank
    }
    
    //하나의 범주로 묶어 사용하고, 한정된 값들이기 때문에 enum을 선택하였습니다.
    enum Suits : String {
        case spade = "♠"
        case heart = "♥"
        case diamond = "◆"
        case club = "♣"
    }
    
    enum Ranks : String {
        case one = "A"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case ten = "10"
        case eleven = "J"
        case twelve = "Q"
        case thirteen = "K"
    }
    
}

extension Card.Ranks {
    
    static func cases() -> AnySequence<Card.Ranks> {
        return AnySequence { () -> AnyIterator<Card.Ranks> in
            var raw = 0
            return AnyIterator {
                let current: Card.Ranks = withUnsafePointer(to: &raw) { $0.withMemoryRebound(to: self, capacity: 1) { $0.pointee } }
                guard current.hashValue == raw else {
                    return nil
                }
                raw += 1
                return current
            }
        }
    }
    
    static var allValues: [Card.Ranks] {
        return Array(self.cases())
    }
    
}

extension Card.Suits {
    static func cases() -> AnySequence<Card.Suits> {
        return AnySequence { () -> AnyIterator<Card.Suits> in
            var raw = 0
            return AnyIterator {
                let current: Card.Suits = withUnsafePointer(to: &raw) { $0.withMemoryRebound(to: self, capacity: 1) { $0.pointee } }
                guard current.hashValue == raw else {
                    return nil
                }
                raw += 1
                return current
            }
        }
    }
    
    static var allValues: [Card.Suits] {
        return Array(self.cases())
    }
}

extension Card : CustomStringConvertible {
    var description : String {
        return "\(self.suit.rawValue)\(self.rank.rawValue)"
    }
}
