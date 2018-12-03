//
//  ANSICode.swift
//  CardGame
//
//  Created by 김장수 on 03/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

// Suits(모양)와 Rank(숫자)를 동일한 형태로 추상화 & 표현

enum Suits: String {
    case spade
    case club
    case diamond
    case heart
    
    var description: String {
        switch self {
        case .spade:    return ANSICode.spade
        case .club:     return ANSICode.club
        case .diamond:  return ANSICode.diamond
        case .heart:    return ANSICode.heart
        }
    }
}

enum Rank: String {
    case ace
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    
    var description: String {
        switch self {
        case .ace:      return "A"
        case .two:      return "2"
        case .three:    return "3"
        case .four:     return "4"
        case .five:     return "5"
        case .six:      return "6"
        case .seven:    return "7"
        case .eight:    return "8"
        case .nine:     return "9"
        case .ten:      return "10"
        case .jack:     return "J"
        case .queen:    return "Q"
        case .king:     return "K"
        }
    }
}
