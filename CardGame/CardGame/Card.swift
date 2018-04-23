//
//  Card.swift
//  CardGame
//
//  Created by 김수현 on 2018. 4. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Card {

    var suit: Suit
    var rank: Rank

    init(_ suit: Suit,_ rank: Rank) {
        self.suit = suit
        self.rank = rank
    }

    enum Suit: String {
        case spade = "♠️"
        case heart = "♥️"
        case diamond = "♦️"
        case club = "♣️"
    }

    enum Rank: String {
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case ten = "10"
        case one = "A"
        case eleven = "J"
        case twelve = "Q"
        case thirteen = "K"
    }

}

extension Card: CustomStringConvertible {
    var description: String {
        return self.suit.rawValue + self.rank.rawValue
    }
}
