//
//  CardPattern.swift
//  CardGame
//
//  Created by JH on 11/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum CardPattern: CustomStringConvertible {
    
    case heart
    case diamond
    case clover
    case spade
    
    var description: String {
        switch self {
        case .heart:
            return "♥️"
        case .diamond:
            return "♦️"
        case .clover:
            return "♣️"
        case .spade:
            return "♠️"
        }
    }

}



