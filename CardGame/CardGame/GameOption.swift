//
//  GameOption.swift
//  CardGame
//
//  Created by BLU on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum GameOption: String, CustomStringConvertible {
    case sevenCardStud = "1"
    case fiveCardStud = "2"
    
    private var name: String {
        switch self {
        case .sevenCardStud:
            return "7카드"
        case .fiveCardStud:
            return "5카드"
        }
    }
    
    var description: String {
        return "\(rawValue). \(name)"
    }
}
