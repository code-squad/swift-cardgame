//
//  GameType.swift
//  CardGame
//
//  Created by hw on 15/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum GameType: Int, CustomStringConvertible{
    var description: String {
        switch self {
        case .sevenCard:
            return "7카드"
        case .fiveCard:
            return "5카드"
        }
    }
    
    case sevenCard = 7
    case fiveCard = 5
    
}
