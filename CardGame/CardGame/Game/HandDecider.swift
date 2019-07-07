//
//  HandDecider.swift
//  CardGame
//
//  Created by CHOMINJI on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct HandDecider {
    static func decideGeneralHand(of collected: [Card: Int]) -> Hands {
        let hands = collected.mapValues {
            CardSetRanking.init(rawValue: Double($0)) ?? .highcard
        }
        return hands
    }
    
    static func decideTwoPair(of generalHands: Hands) -> Hands {
        var hands = generalHands
        let onePairs = hands.filter { $0.value == .onepair }
        if onePairs.count >= 2 {
            onePairs.keys.forEach { hands[$0] = .twopair }
        }
        return hands
    }
    
    typealias straightResult = (isStraight: Bool, maxRank: Card?)
    static func decideStraight(of collected: [Card: Int]) -> (isStraight: Bool, maxRank: Card?) {
        let cards = Array(collected.keys).sorted(by: <)
        var consecutiveState = 1
        var result: straightResult = (isStraight: false, maxRank: nil)
        
        for index in 1..<cards.count {
            let numOfRemainIndices = cards.count - index
            
            guard cards[index-1] + 1 == cards[index] else {
                if numOfRemainIndices < 5 {
                    return result
                }
                continue
            }
            consecutiveState += 1
            result.maxRank = cards[index]

            if consecutiveState >= 5 {
                result.isStraight = true
            }
        }
        return result
    }
}
