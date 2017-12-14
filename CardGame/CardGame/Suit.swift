//
//  Card.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 14..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

enum Suit {
    case heart, diamond, club, spade
    
    var description: String {
        switch self {
        case .heart:
            return "♥️"
        case .diamond:
            return "♦️"
        case .club:
            return "♣️"
        case .spade:
            return "♠️"
        }
    }
    
    static var values: [Suit] {
        return [.club, .diamond, .heart, .spade]
    }
}

