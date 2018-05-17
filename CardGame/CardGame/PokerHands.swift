//
//  PokerHands.swift
//  CardGame
//
//  Created by moon on 2018. 5. 17..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct PokerHands {
    
    // 페어
    func hasPair(_ cards: [Card]) -> Int {
        var pairCount: Int = 0
        for card in cards {
            if cards.contains(card) {
                pairCount += 1
            }
        }
        return pairCount
    }

}
