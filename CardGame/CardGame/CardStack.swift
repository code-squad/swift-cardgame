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
    
    func score() -> Int {
        var pairs = [[Card]]()
        var numberOfPair = [0,0,0,0,0]
        var score = 0
        
        for rank in Rank.allCases {
            let cards = self.cards.filter(){$0.isSame(rank: rank)}
            guard !cards.isEmpty else {continue}
            pairs.append(cards)
        }
        
        pairs.reverse()
        
        for pair in pairs {
            numberOfPair[pair.count] += 1
        }
        
        if numberOfPair[4] == 1 {
            score += 4000
            let fourCard = pairs.filter(){$0.count == 4}
            let maxValueCard = fourCard[0].max { a, b in a.score() < b.score()}
            guard let suitRankScore = maxValueCard?.score() else {return 0}
            score += suitRankScore
            return score
        }
        
        if numberOfPair[3] >= 1 {
            score += 3000
            let triple = pairs.filter(){$0.count == 3}
            let maxValueCard = triple[0].max { a, b in a.score() < b.score()}
            guard let suitRankScore = maxValueCard?.score() else {return 0}
            score += suitRankScore
            return score
        }
        
        if numberOfPair[2] >= 2 {
            score += 2000
            let twoPair = pairs.filter(){$0.count == 2}
            let maxValueCard = twoPair[0].max { a, b in a.score() < b.score()}
            guard let suitRankScore = maxValueCard?.score() else {return 0}
            score += suitRankScore
            return score
        }
        
        if numberOfPair[2] == 1 {
            score += 1000
            let onePair = pairs.filter(){$0.count == 2}
            let maxValueCard = onePair[0].max { a, b in a.score() < b.score()}
            guard let suitRankScore = maxValueCard?.score() else {return 0}
            score += suitRankScore
            return score
        }
        
        if numberOfPair[1] >= 1 {
            let nothing = pairs.filter(){$0.count == 1}
            let maxValueCard = nothing[0].max { a, b in a.score() < b.score()}
            guard let suitRankScore = maxValueCard?.score() else {return 0}
            score += suitRankScore
            return score
        }
        
        return score
    }
}
