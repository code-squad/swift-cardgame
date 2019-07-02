//
//  GameMenu.swift
//  CardGame
//
//  Created by CHOMINJI on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum GameMode: Int, CustomStringConvertible, CaseIterable  {
    case seven = 1, five
    
    var description: String {
        switch self {
        case .seven:
            return "\(rawValue). 7카드"
        case .five:
            return "\(rawValue). 5카드"
        }
    }
    
    var numOfCards: Int {
        switch self {
        case .seven: return 7
        case .five: return 5
        }
    }
}

enum Participant: Int, CaseIterable {
    case one = 1, two, three, four
    
    var count: Int {
        return rawValue
    }
}
