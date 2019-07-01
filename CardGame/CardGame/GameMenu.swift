//
//  GameMenu.swift
//  CardGame
//
//  Created by CHOMINJI on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation


enum GameMenu: Int, CustomStringConvertible, CaseIterable {
    case seven = 1
    case five
    
    var description: String {
        switch self {
        case .seven:
            return "\(rawValue). 7카드"
        case .five:
            return "\(rawValue). 5카드"
        }
    }
}

