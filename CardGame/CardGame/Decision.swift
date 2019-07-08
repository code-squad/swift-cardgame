//
//  Decision.swift
//  CardGame
//
//  Created by Daheen Lee on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Decision {
    static let lowest = Decision(highestRank: Card.Rank.ace, hand: Hands.highCard)
    let highestRank: Card.Rank
    let hand: Hands
    
    init(highestRank: Card.Rank, hand: Hands) {
        self.highestRank = highestRank
        self.hand = hand
    }
}

extension Decision: Equatable, Comparable {
    static func == (lhs: Decision, rhs: Decision) -> Bool {
        return lhs.highestRank == rhs.highestRank && lhs.hand == rhs.hand
    }
    
    static func < (lhs: Decision, rhs: Decision) -> Bool {
        if lhs.hand == rhs.hand {
            return lhs.highestRank < rhs.highestRank
        }
        return lhs.hand < rhs.hand
    }
}
