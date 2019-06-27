//
//  Card.swift
//  CardGame
//
//  Created by 이진영 on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Card {
    
}

extension Card {
    enum Suit: Character, CustomStringConvertible {
        case clubs = "\u{2633}" // ♣️
        case diamonds = "\u{2666}" // ♦️
        case hearts = "\u{2665}" // ♥️
        case spades = "\u{2660}" // ♠️
        
        var description: String {
            return String(rawValue)
        }
    }
}
