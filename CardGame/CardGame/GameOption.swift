//
//  GameOption.swift
//  CardGame
//
//  Created by BLU on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum GameOption: Int, CustomStringConvertible {
    case sevenCardStud = 7
    case fiveCardStud = 5
    
    var description: String {
        return "\(rawValue)카드"
    }
}
