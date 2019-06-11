//
//  Player.swift
//  CardGame
//
//  Created by joon-ho kil on 5/27/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Player: Participant {
    private let name: String
    private var cards = [Card]()
    
    var description: String {
        return "\(name) " + changeCardsToString(cards)
    }
    
    init(name: String, cards: [Card]){
        self.name = name
        self.cards = cards
    }
    
    func compareNameOrdered (otherPlayer: Player) -> Bool {
        return name < otherPlayer.name
    }
    
    func getWinner(_ other: Player?) -> (Player?, String?) {
        guard let otherPlayer = other else {
            return (self, name)
        }
        
        let playerScore = self.checkEqualRankCount()
        let otherPlayerScore = otherPlayer.checkEqualRankCount()
        
        if playerScore.rawValue > otherPlayerScore.rawValue {
            return (self, name)
        }
        
        return (otherPlayer, otherPlayer.name)
    }
    
    private func checkEqualRankCount () -> Score {
        var allSameCardCount = [Int]()
        
        for card in cards {
            let sameCardCount = getSameCardCount(card, cards)
            allSameCardCount.append(sameCardCount)
        }
        
        let existStraigt = checkStraight()
        if existStraigt {
            return Score.straight
        }
        
        if allSameCardCount.max() == 4 {
            return Score.fourOfAKind
        } else if allSameCardCount.max() == 3 {
            return Score.threeOfAKind
        } else if allSameCardCount.max() == 2 {
            let score = checkTwoPair(allSameCardCount)
            return score
        }

        return Score.nonScore
    }

    private func getSameCardCount (_ card: Card, _ cards: [Card]) -> Int {
        var equalRankCount = 0
        
        for cardCompared in cards {
            equalRankCount = addCountIfSameCard (cards: (card, cardCompared), count: equalRankCount)
        }
        
        return equalRankCount
    }

    private func addCountIfSameCard (cards: (Card, Card), count: Int) -> Int {
        if cards.0.equalRank(cards.1) {
            return count+1
        }
        
        return count
    }
    
    private func checkTwoPair(_ allSameCardCount: [Int]) -> Score {
        var numberTwoCount = 0
        for sameCardCount in allSameCardCount {
            if sameCardCount == 2 {
                numberTwoCount += 1
            }
        }
        
        if numberTwoCount > 2 {
            return Score.twoPair
        }
        
        return Score.pair
    }
    
    private func checkStraight () -> Bool {
        var continuousRankCount = 0
        
        for card in cards {
            continuousRankCount = getContinuousRankCount(card, continuousRankCount)
        }
        
        return continuousRankCount == 4
    }
    
    private func getContinuousRankCount (_ minRankCard: Card, _ continuousRankCount: Int) -> Int {
        var resultContinuousRankCount = continuousRankCount
        
        for card in cards {
            if minRankCard.checkPrevRank(card) {
                resultContinuousRankCount = getContinuousRankCount(card, continuousRankCount + 1)
            }
        }
        
        return resultContinuousRankCount
    }
}
