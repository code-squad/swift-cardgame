//
//  HandEvaluator.swift
//  CardGame
//
//  Created by Choi Jeong Hoon on 2018. 1. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
struct Hand {
    enum HandRanks: String {
        static func >(lhs: Hand.HandRanks, rhs: Hand.HandRanks) -> Bool {
            return lhs.hashValue > rhs.hashValue
        }
      
        case noPair
        case onePair
        case twoPair
        case triple
        case straight
        case flush
        case fullHouse
        case fourCard
        case straightFlush
        case royalFlush
        
        var point: Int {
            return self.hashValue
        }
    }
    
    static func getHandName (point: Int) -> HandRanks? {
        switch point {
        case 0 : return .noPair
        case 1: return .onePair
        case 2: return .twoPair
        case 3: return .triple
        case 4: return .straight
        case 5: return .flush
        case 6: return .fullHouse
        case 7: return .fourCard
        case 8: return .straightFlush
        case 9: return .royalFlush
        default: return nil
        }
    }
    
    static func countResult (_ cards: [Card]) -> Int{
        let handRanks = makeHandRanks(cards)
        var result = 0
        handRanks.forEach {
            result += $0.hashValue
        }
        return result
    }
    
    static func makeHandRanks (_ cards: [Card]) -> [HandRanks] {
        let hands = checkFlushToStraight(cards)
        guard hands.count == 0 else { return hands}
        return checkPair(cards)
    }
    
    static func getTopCard (cards: [Card]) -> Card {
        let sortedCard = cards.sorted { $0 > $1 }
        return sortedCard[0]
    }
    
    private static func checkFlushToStraight (_ cards: [Card]) -> [HandRanks] {
        var hands = [HandRanks]()
        if isFlush(cards) && isStraight(cards) == false && isRoyal(cards: cards) == false { hands.append(.flush) }
        else if isStraight(cards) && isFlush(cards) && isRoyal(cards: cards) == false { hands.append(.straightFlush)}
        else if isFlush(cards) && isRoyal(cards: cards) == true { hands.append(.royalFlush) }
        else if isFullHouse(cards) { hands = [HandRanks](); hands.append(.fullHouse)}
        else if isStraight(cards) { hands.append(.straight)}
        return hands.sorted(by: >)
    }
    
    private static func checkPair (_ cards: [Card]) -> [HandRanks] {
        let pairCheck = Card.getPairTypeCard(cards)
        var hands = [HandRanks]()
        pairCheck.forEach {
            switch $0.value.count {
            case 4: hands.append(.fourCard)
            case 3: hands.append(.triple)
            case 2: hands.append(.onePair)
            default: hands.append(.noPair)
            }
        }
        var pairCount = 0
        for pair in hands {
            if pair == .onePair { pairCount += 1 }
        }
        if pairCount == 2 {
            hands = [HandRanks]()
            hands.append(.twoPair)
        }
        return hands.sorted(by: >)
    }
    
    private static func isStraight(_ cards : [Card]) -> Bool {
        let cardsByRanks = cards.sorted { $0 > $1 }
        var straightCounter = 0
        for indexOfCard in 0..<(cardsByRanks.count - 1) {
            if cardsByRanks[indexOfCard].isNextRank(cardsByRanks[indexOfCard + 1]) {
                straightCounter += 1
            }
        }
        return straightCounter >= 5
    }
    
    private static func isFlush(_ cards: [Card]) -> Bool {
        let cardsByRanks = cards.sorted { $0 > $1 }
        let firstCard = cards[0]
        let sameSuit = cardsByRanks.filter({ $0 == firstCard })
        return sameSuit.count >= 5
    }
    
    private static func isRoyal (cards: [Card]) -> Bool {
        let sortedCard = cards.sorted { $0 > $1 }
        return sortedCard[0].isAce()
    }
    
    private static func isFullHouse (_ cards: [Card]) -> Bool {
        let hands = checkPair(cards)
        return hands[0] == .triple && hands[1] == .onePair
    }
}
