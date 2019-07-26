//
//  HandRank.swift
//  CardGame
//
//  Created by JieunKim on 23/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum HandRank: Int {
    case highcard, onePair, twoPair, triple, straight, quads
}

extension HandRank: Comparable {
    static func < (lhs: HandRank, rhs: HandRank) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
