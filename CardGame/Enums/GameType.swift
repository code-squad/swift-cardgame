//
//  GameType.swift
//  CardGame
//
//  Created by hw on 15/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum GameType: Int, CustomStringConvertible{
    
    case sevenCard = 7
    case fiveCard = 5
    
    init (_ number: Int) throws {
        switch number {
        case 1:
            self = .sevenCard
        case 2:
            self = .fiveCard
        default:
            throw GameMenuError.outOfRangePlayer
        }
    }
    var description: String {
        switch self {
        case .sevenCard:
            return "7카드"
        case .fiveCard:
            return "5카드"
        }
    }
}
