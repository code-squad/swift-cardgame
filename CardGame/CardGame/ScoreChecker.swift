//
//  ScoreChecker.swift
//  CardGame
//
//  Created by YOUTH on 2018. 1. 22..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct ScoreChecker {

    enum PokerHands: Int {
        case NoPair = 0
        case OnePair = 100
        case TwoPair = 200
        case ThreeOfAKind = 400
        case Straight = 500
        case Flush = 600
        case FullHouse = 700
        case FourOfAKind = 900
        case StraightFlush = 1500
    }

    private func sortCards(_ cardStack: CardStack) -> [Card] {
        let cards = cardStack.cards
        let sorted = cards.sorted(by: { $0.denomination.rawValue < $1.denomination.rawValue })
        return sorted
    }

    private func isStraight(_ cards: [Card]) -> Bool {
        var count = 0
        for i in 1..<cards.count {
            if (cards[i-1].denomination.rawValue + 1) == cards[i].denomination.rawValue {
                count += 1
            }
        }
        return count >= 4
    }

    private func isFlush(_ cards: [Card]) -> Bool {
        var count = 0
        for i in 1..<cards.count {
            if cards[i-1].suit.hashValue == cards[i].suit.hashValue {
                count += 1
            }
        }
        return count >= 4 // true인 경우
    }

    private func matchStraightOrFlush(_ cards: [Card]) -> [PokerHands] {
        var hands = [PokerHands]()
        if isStraight(cards) && isFlush(cards) {
            hands.append(.StraightFlush)
        }
        if isFlush(cards) && (isStraight(cards) == false) {
            hands.append(.Flush)
        }
        if isStraight(cards) && (isFlush(cards) == false) {
            hands.append(.Straight)
        }
        return hands
    }

    // matchStraightOrFlush의 리턴값 [PokerHands].count == 0이면 matchpairs로
    private func matchPairs(_ cards: [Card]) -> [PokerHands] {
        let pairCheck = cards.reduce(into: [String:[Card]]()) {
            $0[$1.denomination.description, default: []].append($1)
        }
        var hands = [PokerHands]()
        pairCheck.forEach {
            switch $0.value.count {
            case 4: hands.append(.FourOfAKind)
            case 3: hands.append(.ThreeOfAKind)
            case 2: hands.append(.OnePair)
            default: hands.append(.NoPair)
            }
        }
        return hands
    }

    // 최종 집계점수 리턴
    func totalScore(cardStack: CardStack) -> Int {
        var pokerHands = [PokerHands]()
        let cards = sortCards(cardStack)
        var score = 0
        pokerHands = matchStraightOrFlush(cards)
        if pokerHands.count == 0 {
           pokerHands = matchPairs(cards)
        }
        for i in 0..<pokerHands.count {
            score += pokerHands[i].rawValue
        }
        return score
    }


}
