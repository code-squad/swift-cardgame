//
//  Numbers.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 14..
//  Copyright © 2017년 YUAMING. All rights reserved.
//

import Foundation

enum Number: Int {
    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
    
    static var allValues: [Number] {
        return [.ace, .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king]
    }
}

extension Number {
    var straightValues: [Int] {
        return [self.rawValue] + (self == .ace ? [0] : [])
    }
}

extension Number: CustomStringConvertible {
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
            return String(self.rawValue)
        }
    }
}
