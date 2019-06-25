//
//  Card.swift
//  CardGame
//
//  Created by CHOMINJI on 25/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Card {
    enum Suit: String, CustomStringConvertible {
        case hearts = "❤️"
        case diamonds = "♦️"
        case spades = "♠️"
        case clubs = "♣️"
        
        var description: String {
            return rawValue
        }
    }
}
