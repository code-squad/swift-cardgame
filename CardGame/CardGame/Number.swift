//
//  Numbers.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 14..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

enum Number: String {
    case ace, king, queen, jack
    case ten = "10", nine = "9", eight = "8", seven = "7", six = "6", five = "5", four = "4", three = "3", two = "2"
    
    var description: String {
        switch self {
        case .ace:
            return "A"
        case .king:
            return "K"
        case .queen:
            return "Q"
        case .jack:
            return "J"
        default: 
            return self.rawValue
        }
    }
}
