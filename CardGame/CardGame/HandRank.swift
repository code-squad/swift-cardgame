//
//  HandRank.swift
//  CardGame
//
//  Created by 이진영 on 25/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum HandRank: Int, Comparable {
    case highCard, pair, twoPairs, trips, straight, quads
    
    static func < (lhs: HandRank, rhs: HandRank) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
