//
//  Hands.swift
//  CardGame
//
//  Created by Daheen Lee on 03/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Hands: Int {
    case highCard = 0
    case onePair
    case twoPair
    case threeOfKind
    case straight
    case fourOfKind

    init(sameCardsCount: Int) {
        switch sameCardsCount {
        case 2:
            self = .onePair
        case 3:
            self = .threeOfKind
        case 4:
            self = .fourOfKind
        default:
            self = .highCard
        }
    }
}

extension Hands: Comparable {
    static func < (lhs: Hands, rhs: Hands) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
