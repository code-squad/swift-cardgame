//
//  CardStack.swift
//  CardGame
//
//  Created by 조재흥 on 18. 12. 6..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class CardStack : CustomStringConvertible {
    private var cards : [Card]
    var description: String {
        return "\(self.cards)"
    }
    
    init(cards:[Card]) {
        self.cards = cards
    }
    
    func push(card:Card) {
        self.cards.append(card)
    }
    
    func pop() -> Card? {
        return cards.popLast()
    }
    
    func peek() -> Card? {
        return cards.last
    }
    
    private func gatherInPairs() -> [[Card]] {
        var pairs = [[Card]]()
        
        for rank in Rank.allCases {
            let cards = self.cards.filter(){$0.isSame(rank: rank)}
            guard !cards.isEmpty else {continue}
            pairs.append(cards)
        }
        
        return pairs.reversed()
    }
    
    private func numberOfPairs(pairs:[[Card]]) -> [Int] {
        var numberOfPair = [0,0,0,0,0]
        
        for pair in pairs {
            numberOfPair[pair.count] += 1
        }
        
        return numberOfPair
    }
    
    func score() -> Int {
        let pairs = self.gatherInPairs()
        var numberOfPair = self.numberOfPairs(pairs: pairs)
        
        if numberOfPair[4] == 1 {
            return calculateScore(handRankingScore: 4000, bundle: 4)
        }
        
        if numberOfPair[3] >= 1 {
            return calculateScore(handRankingScore: 3000, bundle: 3)
        }
        
        if numberOfPair[2] >= 2 {
            return calculateScore(handRankingScore: 2000, bundle: 2)
        }
        
        if numberOfPair[2] == 1 {
            return calculateScore(handRankingScore: 1000, bundle: 2)
        }
        
        if numberOfPair[1] >= 1 {
            return calculateScore(handRankingScore: 0, bundle: 1)
        }
        
        return 0
    }
    
    private func calculateScore(handRankingScore:Int, bundle:Int) -> Int {
        var score = handRankingScore
        let handRanking = self.gatherInPairs().filter(){$0.count == bundle}
        let maxValueCard = handRanking[0].max { cardA, cardB in cardA.score() < cardB.score()}
        guard let suitRankScore = maxValueCard?.score() else {return 0}
        score += suitRankScore
        return score
    }
}
