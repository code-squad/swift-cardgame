//
//  HandRank.swift
//  CardGame
//
//  Created by JieunKim on 23/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum HandRank: Double {
    //  숫자가 없을 경우 또는 같은 핸즈인 경우 숫자가 높은 카드가 우승
    case highcard = 0
    case onePair = 2
    case twoPair = 2.5
    case triple = 3.0
    case straight = 3.5
    case fourcard = 4
}

extension HandRank: Comparable {
    static func < (lhs: HandRank, rhs: HandRank) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
