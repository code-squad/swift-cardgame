//
//  Card.swift
//  CardGame
//
//  Created by JieunKim on 03/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Card: CustomStringConvertible {
    
    var description: String = ""
}

extension Card {
    
    enum Suits: Character, CustomStringConvertible {
        case spade = "\u{2660}"
        case heart = "\u{2665}"
        case diamond = "\u{2666}"
        case clovar = "\u{2633}"
        
        var description: String{
            return String(rawValue)
        }
    }
    
    enum Ranks: Int, CustomStringConvertible {
        case ace = 1,two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
        
        var description: String {
            switch self {
            case .ace:
                return "A"
            case .jack:
                return "J"
            case .queen:
                return "Q"
            case .king:
                return "K"
            default:
                return String(rawValue)
            }
        }
    }
}
