//
//  ScoreCalculator.swift
//  CardGame
//
//  Created by 조재흥 on 18. 12. 10..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct ScoreCalculator {
    private static func numberOfPairs(pairs:[[Card]]) -> [Int] {
        var numberOfPair = [0,0,0,0,0]
        
        for pair in pairs {
            numberOfPair[pair.count] += 1
        }
        
        return numberOfPair
    }
    
    static func calculateScore(cardStack:CardStack) -> Int {
        let pairs = cardStack.gatherInPairs()
        var numberOfPair = self.numberOfPairs(pairs: pairs)
        
        if numberOfPair[4] == 1 {
            return calculateScore(pairs:pairs, handRankingScore: 4000, bundle: 4)
        }
        
        if numberOfPair[3] >= 1 {
            return calculateScore(pairs:pairs, handRankingScore: 3000, bundle: 3)
        }
        
        if numberOfPair[2] >= 2 {
            return calculateScore(pairs:pairs, handRankingScore: 2000, bundle: 2)
        }
        
        if numberOfPair[2] == 1 {
            return calculateScore(pairs:pairs, handRankingScore: 1000, bundle: 2)
        }
        
        if numberOfPair[1] >= 1 {
            return calculateScore(pairs:pairs, handRankingScore: 0, bundle: 1)
        }
        
        return 0
    }
    
    private static func calculateScore(pairs:[[Card]], handRankingScore:Int, bundle:Int) -> Int {
        var score = handRankingScore
        let handRanking = pairs.filter(){$0.count == bundle}
        let maxValueCard = handRanking[0].max { cardA, cardB in cardA.score() < cardB.score()}
        guard let suitRankScore = maxValueCard?.score() else {return 0}
        score += suitRankScore
        return score
    }
}
