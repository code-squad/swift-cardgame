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
    
    func comparePoint(_ other: Player?) -> (Player?, String?) {
        guard let otherPlayer = other else {
            return (self, name)
        }
        
        let playerScore = self.checkEqualRankCount()
        let otherPlayerScore = otherPlayer.checkEqualRankCount()
        
        if playerScore.0.rawValue > otherPlayerScore.0.rawValue {
            return (self, name)
        }
        if playerScore.0.rawValue < otherPlayerScore.0.rawValue {
            return (otherPlayer, otherPlayer.name)
        }
        
        if playerScore.0 == Score.nonScore {
            return (nil, nil)
        }
        
        guard let playerMaxCard = playerScore.1 else {
            return (otherPlayer, otherPlayer.name)
        }
        
        guard let otherPlayerMaxCard = otherPlayerScore.1 else {
            return (self, name)
        }
        
        if playerMaxCard.isHigherThan(otherPlayerMaxCard) {
            return (self, name)
        }
        
        return (otherPlayer, otherPlayer.name)
    }
    
    private func checkEqualRankCount () -> (Score, Card?) {
        var allSameCardCount = [Int]()
        
        for card in cards {
            let sameCardCount = getSameCardCount(card, cards)
            allSameCardCount.append(sameCardCount)
        }
        
        let existStraigt = checkStraight()
        if existStraigt.0 {
            return (Score.straight, existStraigt.1)
        }
        
        if allSameCardCount.max() == 4 {
            let maxCard = getMaxPointCard(allSameCardCount, sameCardNumber: 4)
            
            return (Score.fourOfAKind, maxCard)
        }
        if allSameCardCount.max() == 3 {
            let maxCard = getMaxPointCard(allSameCardCount, sameCardNumber: 3)
            
            return (Score.threeOfAKind, maxCard)
        }
        if allSameCardCount.max() == 2 {
            let score = checkTwoPair(allSameCardCount)
            let maxCard = getMaxPointCard(allSameCardCount, sameCardNumber: 2)
            
            return (score, maxCard)
        }

        return (Score.nonScore, nil)
    }

    private func getSameCardCount (_ card: Card, _ cards: [Card]) -> Int {
        var equalRankCount = 0
        
        for cardCompared in cards {
            equalRankCount = addCountIfSameCard (cards: (card, cardCompared), count: equalRankCount)
        }
        
        return equalRankCount
    }

    private func addCountIfSameCard (cards: (Card, Card), count: Int) -> Int {
        if cards.0.isEqualToRank(cards.1) {
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
    
    private func checkStraight () -> (Bool, Card?) {
        var continuousRankCount = 0
        var maxCard: Card?
        
        for card in cards {
            (continuousRankCount, maxCard) = getContinuousRankCount(card, continuousRankCount)
        }
        
        return (continuousRankCount == 5, maxCard)
    }
    
    private func getContinuousRankCount (_ maxRankCard: Card, _ continuousRankCount: Int) -> (Int, Card?) {
        var resultContinuousRankCount = continuousRankCount
        var resultMaxCard: Card?
        
        for card in cards {
            if maxRankCard.isNextRankThan(card) {
                (resultContinuousRankCount,  resultMaxCard) = getContinuousRankCount(card, continuousRankCount + 1)
            }
        }
        
        return (resultContinuousRankCount, resultMaxCard)
    }
    
    private func getMaxPointCard (_ allSameCardCount: [Int], sameCardNumber: Int) -> Card {
        let sameCardIndex = allSameCardCount.enumerated().filter({ $0.element == sameCardNumber }).map({ $0.offset })
        var sameCards = [Card]()
        
        for index in sameCardIndex {
            sameCards.append(cards[index])
        }
        
        var maxCard = sameCards.removeFirst()
        
        for card in sameCards {
            if card.isHigherThan(maxCard) {
                maxCard = card
            }
        }
        
        return maxCard
    }
}
