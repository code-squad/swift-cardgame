//
//  ScoreCalculator.swift
//  CardGame
//
//  Created by 조재흥 on 18. 12. 10..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct ScoreCalculator {    
    static func calculateScore(cardStack:CardStack) -> Int {
        cardStack.gatherInPairs()
        cardStack.countNumberOfPair()
        
        if cardStack.numberPair(4) == 1 {
            return calculateScore(cardStack:cardStack, handRanking:.fourCard)
        }
        
        if cardStack.numberPair(3) >= 1 {
            return calculateScore(cardStack:cardStack, handRanking:.triple)
        }
        
        if cardStack.numberPair(2) >= 2 {
            return calculateScore(cardStack:cardStack, handRanking:.twoPair)
        }
        
        if cardStack.numberPair(2) == 1 {
            return calculateScore(cardStack:cardStack, handRanking:.onePair)
        }
        
        if cardStack.numberPair(1) >= 1 {
            return calculateScore(cardStack:cardStack, handRanking:.highCard)
        }
        
        return 0
    }
    
    private static func calculateScore(cardStack:CardStack, handRanking:HandRanking) -> Int {
        var score = handRanking.rawValue
        guard let handRanking = cardStack.handRanking(bundle: handRanking.bundle()) else {return 0}
        let maxValueCard = handRanking[0].max { cardA, cardB in cardA.score() < cardB.score()}
        guard let suitRankScore = maxValueCard?.score() else {return 0}
        score += suitRankScore
        return score
    }
}
