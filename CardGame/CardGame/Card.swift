//
//  Card.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 14..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Card {
    private let suit: Suit
    private let number: Number
    
    init(_ suit: Suit, _ number: Number) {
        self.number = number
        self.suit = suit
    }
    
    var description: String {
        return suit.description + number.description
    }
}
