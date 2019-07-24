//
//  HandDecisionMaker.swift
//  CardGame
//
//  Created by JieunKim on 23/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

import Foundation

struct HandDecisionMaker {
    static func decideGeneralHand(collected: [Card: Int]) -> Hands {
        let hands = collected.mapValues {
            HandRank.init(rawValue: Double($0)) ?? .highcard
        }
        return hands
    }
    
    static func decideTwoPair(generalHands: Hands) -> Hands {
        var hands = generalHands
        let onePairs = hands.filter { $0.value == .onePair }
        if onePairs.count >= 2 {
            onePairs.keys.forEach { hands[$0] = .twoPair }
        }
        return hands
    }
    
    typealias straightResult = (isStraight: Bool, maxRank: Card?)
    static func decideStraight(collected: [Card: Int]) -> (isStraight: Bool, maxRank: Card?) {
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
