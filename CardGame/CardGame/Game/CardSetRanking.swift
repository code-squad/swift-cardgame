//
//  CardSetRanking.swift
//  CardGame
//
//  Created by CHOMINJI on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum CardSetRanking: Int {
    case highcard = 0
    case onepair
    case twopair
    case triple
    case straight
    case fourcard
}

extension CardSetRanking: Comparable {
    static func < (lhs: CardSetRanking, rhs: CardSetRanking) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
