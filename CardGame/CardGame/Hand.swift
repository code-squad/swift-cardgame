//
//  HandEvaluator.swift
//  CardGame
//
//  Created by Choi Jeong Hoon on 2018. 1. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
struct Hand {
    private var cards: [Card]
    init(_ cards: [Card]) {
        self.cards = cards
    }
    
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
        case royalStraightFlush
        
        var point: Int {
            return self.hashValue
        }
    }
    
    static func getHandName(point: Int) -> HandRanks? {
        switch point {
        case 0: return .noPair
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
    
     func countResult() -> Int{
        let handRanks = makeHandRanks()
        var result = 0
        handRanks.forEach {
            result += $0.hashValue
        }
        return result
    }
    
    func getTopCard() -> Card {
        let sortedCard = cards.sorted { $0 > $1 }
        return sortedCard[0]
    }
    
    func makeHandRanks() -> [HandRanks] {
        let hands = checkFlushToStraight()
        guard hands.count == 0 else { return hands}
        return checkPair()
    }
    
    private  func checkFlushToStraight() -> [HandRanks] {
        var hands = [HandRanks]()
        if isFlush() && isRoyal( ) { hands.append(.royalFlush) }
        else if isStraight() && isFlush() { hands.append(.straightFlush)}
        else if isFlush() { hands.append(.flush) }
        else if isFullHouse() { hands.append(.fullHouse)}
        else if isStraight() { hands.append(.straight)}
        return hands
    }
    
    private  func checkPair() -> [HandRanks] {
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
        if pairCount >= 2 {
            hands = [HandRanks]()
            hands.append(.twoPair)
        }
        return hands.sorted(by: >)
    }
    
    private  func isStraight() -> Bool {
        let cardsByRanks = cards.sorted { $0 > $1 }
        var straightCounter = 0
        for indexOfCard in 0..<(cardsByRanks.count - 1) {
            if cardsByRanks[indexOfCard].isNextRank(cardsByRanks[indexOfCard + 1]) {
                straightCounter += 1
            }
        }
        return straightCounter >= 5
    }
    
    private  func isFlush() -> Bool {
        let cardsByRanks = cards.sorted { $0 > $1 }
        let firstCard = cards[0]
        let sameSuit = cardsByRanks.filter({ $0 == firstCard })
        return sameSuit.count >= 5
    }
    
    private  func isRoyal() -> Bool {
        let sortedCard = cards.sorted { $0 > $1 }
        return sortedCard[0].isAce()
    }
    
    private  func isFullHouse() -> Bool {
        let hands = checkPair()
        return hands[0] == .triple && hands[1] == .onePair
    }
}
