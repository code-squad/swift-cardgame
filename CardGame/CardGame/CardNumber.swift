//
//  CardNumber.swift
//  CardGame
//
//  Created by JH on 11/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum CardNumber: CustomStringConvertible {
    
    case one
    case two, three, four, five, six, seven, eight, nine, ten
    case eleven
    case twelve
    case thirteen
    
    var description: String {
        switch self {
        case .one:
            return "A"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .ten:
            return "10"
        case .eleven:
            return "J"
        case .twelve:
            return "Q"
        case .thirteen:
            return "K"
        }
    }
}
