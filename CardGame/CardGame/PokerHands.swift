//
//  PokerHands.swift
//  CardGame
//
//  Created by moon on 2018. 5. 17..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct PokerHands {
    
    // 원페어
    func hasPair(_ cards: [Card]) -> Int {
        var pairCount: Int = 0
        for index in 0..<cards.count {
            if cards[index] == cards[index + 1] {
                pairCount += 1
            }
        }
        return pairCount
    }
}
