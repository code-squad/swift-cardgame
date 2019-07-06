//
//  Card.swift
//  CardGame
//
//  Created by JieunKim on 03/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Card: CustomStringConvertible {
    private let suit: Suits, rank: Ranks
    
    init(suit: Suits, rank: Ranks) {
        self.suit = suit
        self.rank = rank
    }
    
    var description: String {
        return "\(suit)\(rank)"
    }
}

// Suits와 Ranks 둘 다 한정된 값이기 때문에 enum을 사용하는게 맞다고 판단하였습니다.
extension Card {
    
    enum Suits: Character, CustomStringConvertible, CaseIterable  {
        case spade = "\u{2660}"
        case heart = "\u{2665}"
        case diamond = "\u{2666}"
        case clovar = "\u{2633}"
        
        var description: String{
            return String(rawValue)
        }
    }
    
    enum Ranks: Int, CustomStringConvertible, CaseIterable {
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
