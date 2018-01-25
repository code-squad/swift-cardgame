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
    
    func isStraight(_ userCards : [Card]) -> Bool {
        let cardsByRanks = userCards.sorted { $0 > $1 }
        var straightCounter = 0
        for indexOfCard in 0..<(cardsByRanks.count - 1) {
            if cardsByRanks[indexOfCard].isNextRank(cardsByRanks[indexOfCard + 1]) {
                straightCounter += 1
            }
        }
        return straightCounter >= 5
    }
    
    func isFlush(_ card: [Card]) -> Bool {
        let cardsByRanks = card.sorted { $0 > $1 }
        let firstCard = card[0]
        let sameSuit = cardsByRanks.filter({ $0 == firstCard })
        return sameSuit.count >= 5
    }
    
    func isRoyal (card: [Card]) -> Bool {
        let sortedCard = card.sorted { $0 > $1 }
        return sortedCard[0].isAce()
    }
    
    func isFullHouse (_ handRanks: [Card]) -> Bool {
        let hands = checkPair(handRanks)
        return hands.contains(.triple) && hands.contains(.onePair)
    }
    
    func countResult (_ handranks: [HandRanks]) -> Int{
        var result = 0
        handranks.forEach {
            result += $0.hashValue
        }
        return result
    }
    
    func makeHandRanks (_ cards: [Card]) -> [HandRanks] {
        let hands = checkFlushToStraight(cards)
        guard hands.count == 0 else { return hands}
        return checkPair(cards)
    }
    
    func checkFlushToStraight (_ cards: [Card]) -> [HandRanks] {
        var hands = [HandRanks]()
        if isFlush(cards) && !isRoyal(card: cards) == false && isStraight(cards) == false && isRoyal(card: cards) == false { hands.append(.flush) }
        else if isStraight(cards) && isFlush(cards) && isRoyal(card: cards) == false { hands.append(.straightFlush)}
        else if isFlush(cards) && isRoyal(card: cards) == true { hands.append(.royalFlush) }
        else if isFullHouse(cards) { hands = [HandRanks](); hands.append(.fullHouse)}
        else if isStraight(cards) { hands.append(.straight)}
        return hands.sorted(by: >)
    }
    
    func checkPair (_ cards: [Card]) -> [HandRanks] {
        let pairCheck = Card(.ace, .club).getPairTypeCard(cards)
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
}
