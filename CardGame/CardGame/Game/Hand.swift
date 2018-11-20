//
//  Hand.swift
//  CardGame
//
//  Created by 윤지영 on 20/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum Hand {
    case highCard(Rank)
    case onePair(Rank)
    case twoPair(Rank)
    case threeOfAKind(Rank)
    case fourOfAKind(Rank)

    var rank: Rank {
        switch self {
        case let .highCard(rank): return rank
        case let .onePair(rank): return rank
        case let .twoPair(rank): return rank
        case let .threeOfAKind(rank): return rank
        case let .fourOfAKind(rank): return rank
        }
    }

    var ranking: Int {
        switch self {
        case .highCard: return 0
        case .onePair: return 1
        case .twoPair: return 2
        case .threeOfAKind: return 3
        case .fourOfAKind: return 4
        }
    }
}

extension Hand: Comparable {
    static func < (lhs: Hand, rhs: Hand) -> Bool {
        if lhs.ranking == rhs.ranking {
            return lhs.rank.rawValue < rhs.rank.rawValue
        }
        return lhs.ranking < rhs.ranking
    }
}
