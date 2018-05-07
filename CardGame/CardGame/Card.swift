//
//  Card.swift
//  CardGame
//
//  Created by moon on 2018. 5. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Card {
    
    enum Suit {
        case clubs
        case diamonds
        case hearts
        case spades
    }
    
    enum Number {
        case two, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
    }
    
    let suit: Suit
    let number: Number
    
    init(suit: Suit, number: Number) {
        self.suit = suit
        self.number = number
    }
}
