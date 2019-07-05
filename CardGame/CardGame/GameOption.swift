//
//  GameOption.swift
//  CardGame
//
//  Created by BLU on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum GameOption: String, CustomStringConvertible, CaseIterable {
    case sevenCardStud = "1"
    case fiveCardStud = "2"
    
    var numberOfCards: Int {
        switch self {
        case .sevenCardStud:
            return 7
        case .fiveCardStud:
            return 5
        }
    }
    
    var description: String {
        return "\(rawValue). \(numberOfCards)카드"
    }
}
