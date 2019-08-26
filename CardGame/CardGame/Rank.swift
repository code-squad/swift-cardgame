//
//  Rank.swift
//  CardGame
//
//  Created by 이진영 on 23/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Rank {
    private let handRank: HandRank
    private let card: Card
    
    init(handRank: HandRank, card: Card) {
        self.handRank = handRank
        self.card = card
    }
}

extension Rank: Comparable {
    static func < (lhs: Rank, rhs: Rank) -> Bool {
        if lhs.handRank == rhs.handRank {
            return lhs.card < rhs.card
        }
        
        return lhs.handRank < rhs.handRank
    }
    
    static func == (lhs: Rank, rhs: Rank) -> Bool {
        if lhs.handRank == rhs.handRank {
            return lhs.card == rhs.card
        }
        
        return lhs.handRank == rhs.handRank
    }
}
