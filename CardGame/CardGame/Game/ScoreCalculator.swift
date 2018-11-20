//
//  ScoreCalculator.swift
//  CardGame
//
//  Created by 윤지영 on 20/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct ScoreCalculator {

    static private func count(_ rank: Rank, in cards: [Card]) -> Int? {
        var count = 0
        for card in cards {
            if card.hasSame(rank) {
                count += 1
            }
        }
        guard count != 0 else { return nil }
        return count
    }

    static private func countRank(of cards: [Card]) -> [Rank: Int] {
        var numberOfRanks: [Rank: Int] = [:]
        for rank in Rank.allCases {
            guard let count = count(rank, in: cards) else { continue }
            numberOfRanks[rank] = count
        }
        return numberOfRanks
    }

    static private func makeHands(from cards: [Card]) -> [Hand] {
        let numberOfRanks: [Rank: Int] = countRank(of: cards)
        var hands: [Hand] = []
        for rankAndCount in numberOfRanks {
            let rank = rankAndCount.key
            switch rankAndCount.value {
            case 4: hands.append(Hand.fourOfAKind(rank))
            case 3: hands.append(Hand.threeOfAKind(rank))
            case 2: hands.append(Hand.onePair(rank))
            case 1: hands.append(Hand.highCard(rank))
            default: continue
            }
        }
        return hands
    }

    static func getBestHand(from cards: [Card]) -> Hand? {
        let hands = makeHands(from: cards)
        guard let bestHand = hands.max() else { return nil }
        return bestHand
    }

}
