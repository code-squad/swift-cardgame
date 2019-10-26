//
//  number.swift
//  swift-cardgame
//
//  Created by Jin Hyung Park on 10/26/19.
//

import Foundation

enum Rank: Int {
    case One, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Eleven, Twelve, Thirteen
    var description: String {
        switch self {
        case .One:
            return "A"
        case .Three:
            return "J"
        case .Twelve:
            return "Q"
        case .Thirteen:
            return "K"
        default:
            return String(rawValue)
        }
    }
}
//end of code
