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

