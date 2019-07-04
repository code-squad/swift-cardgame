//
//  HandsDeterminator.swift
//  CardGame
//
//  Created by Daheen Lee on 03/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

typealias Decision = (highestRank: Card.Rank, hand: Hands)

struct HandsDeterminator {
    static let countForStraight = 5
    static let lowestDecision = (Card.Rank.ace, Hands.highCard)
    
    static func determine(using cards: [Card]) -> Decision {
        var rankCounter = [Card.Rank: Int]()
        for card in cards {
            rankCounter[card.rank, default: 0] += 1
        }
        if let straightDecision = determineStraight(using: rankCounter) {
            return straightDecision
        }
        guard let sameCardsDecision = determineSameCards(using: rankCounter) else {
            return lowestDecision
        }
        return sameCardsDecision
    }
    
    static private func determineStraight(using rankCounter: [Card.Rank: Int]) -> Decision? {
        let sortedRanks = rankCounter.keys.sorted { $0 > $1 } // decending
        guard sortedRanks.count >= countForStraight else {
            return nil
        }
        var startIndex = 0
        while startIndex <= sortedRanks.count - countForStraight {
            let highestRank = sortedRanks[startIndex]
            let serialCount = countSerialRanks(from: startIndex, in: sortedRanks)
            if serialCount == countForStraight {
                return (highestRank, Hands.straight)
            }
            startIndex += 1
        }
        return nil
    }
    
    static private func countSerialRanks(from index: Int, in sortedRanks: [Card.Rank]) -> Int {
        var serialCount = 0
        var index = index
        while index < sortedRanks.count - 1 && serialCount < countForStraight {
            let before = sortedRanks[index]
            let after = sortedRanks[index + 1]
            guard let next = before.next(), after == next else {
                return serialCount
            }
            serialCount += 1
            index += 1
        }
        return serialCount
    }
    
    static private func determineSameCards(using rankCounter: [Card.Rank: Int]) -> Decision? {
        let possibleDecisions = rankCounter.mapValues { Hands(count: $0) }
        let sortedPossibleDecisions = possibleDecisions.sorted { // Hands descending, Rank decending
            if $0.value == $1.value {
                return $0.key > $1.key
            }
            return $0.value > $1.value
        }
        guard let (highestRank, highestHand) = sortedPossibleDecisions.first else {
            return nil
        }
        let totalPairs = sortedPossibleDecisions.filter { $0.value == Hands.onePair }
        if totalPairs.count >= 2 {
            return (highestRank, Hands.twoPair)
        }
        return (highestRank, highestHand)
    }
}
