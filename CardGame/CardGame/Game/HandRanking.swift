//
//  HandRanking.swift
//  CardGame
//
//  Created by CHOMINJI on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum HandRanking: Double {
    case highcard = 0
    case onepair = 2
    case twopair = 2.5
    case triple = 3
    case straight = 3.5
    case fourcard = 4
}

extension HandRanking: Comparable {
    static func < (lhs: HandRanking, rhs: HandRanking) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
