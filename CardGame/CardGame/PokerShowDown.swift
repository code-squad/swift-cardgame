//
//  PokerShowDown.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 12. 4..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

typealias PokerShowDownResult = (pokerHand: PokerShowDown.PokerHands, top: Card)

struct PokerShowDown {
    private let cards: CardPack

    private var top: Card?
    private var rankCounter: [Card.Rank:Int] = [:]
    private var rankSortedCounter: Array<(key: Card.Rank, value: Int)> = []
    private var suitCounter: [Card.Suit:Int] = [:]
    private var hasMoreTriple: Bool = false
    private var pokerHand: PokerHands = .none

    init(cards: CardPack) {
        self.cards = cards
    }

    enum PokerHands: Int, Comparable {
        case none
        case onePair, twoPair // 숫자가 같은 카드 2장 1세트, 2세트 이상
        case threeOfAKind     // 숫자가 같은 카드 3장.(트리플)
        case straight         // 숫자가 연속된 카드 5장
        case flush            // 숫자 상관없이 무늬가 같은 카드 5장.
        case fullHouse        // 트리플과 원 페어가 같이 존재.
        case fourOfAKind      // 숫자가 같은 카드 4장.(포카드)
        case straightFlush    // 숫자가 연속되고 무늬가 같은 카드 5장.

        static func <(lhs: PokerHands, rhs: PokerHands) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
        
    }

    mutating func openCards() -> PokerShowDownResult {
        pokerHand = showDown()
        return (pokerHand, top!)
    }

    private mutating func showDown() -> PokerHands {
        countSameSuit()
        if isStraightFlush() {
            return .straightFlush
        } else if isFlush() {
            return .flush
        } else if isFourOfAKind() {
            return .fourOfAKind
        } else if isFullHouse() {
            return .fullHouse
        } else if isStraight() || isBackStraight() {
            return .straight
        } else if isThreeOfAKind() {
            return .threeOfAKind
        } else if isTwoPair() {
            return .twoPair
        } else if isOnePair() {
            return .onePair
        } else {
            top = cards.max()
            return .none
        }
    }

    // 같은 Rank를 확인하는 부분
    private mutating func countSameRank() {
        for card in cards {
            countRankCounter(card: card)
        }
        rankSortedCounter = rankCounter.sorted(by: { $0.key.rawValue < $1.key.rawValue })
    }

    private mutating func countRankCounter(card: Card) {
        if rankCounter[card.rank] == nil {
            rankCounter[card.rank] = 1
        } else {
            rankCounter[card.rank]! += 1
            setTopForRankCounter(card: card)
        }
    }

    // 같은 Rank에 따른 top 세팅
    private mutating func setTopForRankCounter(card: Card) {
        if rankCounter[card.rank]! >= 2 && !hasMoreTriple {
            top = card
        }
        if rankCounter[card.rank]! >= 3 {
            top = card
            hasMoreTriple = true
        }
    }

    // 같은 Suit를 확인하는 부분
    private mutating func countSameSuit() {
        for card in cards {
            countSuitCounter(card: card)
        }
    }

    private mutating func countSuitCounter(card: Card) {
        if suitCounter[card.suit] == nil {
            suitCounter[card.suit] = 1
        } else {
            suitCounter[card.suit]! += 1
            setTopForSuitCounter(card: card)
        }
    }

    // 같은 Suit에 따른 top 세팅
    private mutating func setTopForSuitCounter(card: Card) {
        if suitCounter[card.suit]! >= 5 {
            top = card
        }
    }

    private func isOnePair() -> Bool {
        var pairCounter: Int = 0
        for (_, value) in rankCounter where value == 2 {
            pairCounter += 1
        }
        return pairCounter == 1
    }

    private func isTwoPair() -> Bool {
        var pairCounter: Int = 0
        for (_, value) in rankCounter where value == 2 {
            pairCounter += 1
        }
        return pairCounter >= 2
    }

    private func isThreeOfAKind() -> Bool {
        for (_, value) in rankCounter where value == 3 {
            return true
        }
        return false
    }

    private mutating func isStraight() -> Bool {
        var counter: Int = 0
        for i in 1..<rankSortedCounter.count {
            if rankSortedCounter[i].key.rawValue == rankSortedCounter[i-1].key.rawValue+1 {
                counter += 1
            } else {
                counter = 0
            }
            if counter >= 4 {
                setTopForStraight(rank: rankSortedCounter[i].key)
                return true
            }
        }
        return false
    }

    private mutating func setTopForStraight(rank: Card.Rank) {
        for j in stride(from: cards.count-1, to: 0, by: -1) where rank == cards[j].rank {
            top = cards[j]
        }
    }

    private mutating func isBackStraight() -> Bool {
        var counter: [Card.Rank:Int] = [:]
        for card in cards where card.rank == .ace || card.rank == .two || card.rank == .three || card.rank == .four || card.rank == .five {
            counter[card.rank] = (counter[card.rank] ?? 1) + 1
        }
        if counter.count == 5 {
            setTopForBackStraight()
            return true
        }
        return false
    }

    private mutating func setTopForBackStraight() {
        for card in cards where card.rank == .five {
            top = card
        }
    }

    private func isFlush() -> Bool {
        for (_, value) in suitCounter where value >= 5 {
            return true
        }
        return false
    }

    private func isFullHouse() -> Bool {
        return isThreeOfAKind() && isOnePair()
    }

    private mutating func isFourOfAKind() -> Bool {
        countSameRank()
        for (_, value) in rankCounter where value == 4 {
            return true
        }
        return false
    }

    private mutating func isStraightFlush() -> Bool {
        var sameSuitCards: [Card] = []
        if isFlush() {
            sameSuitCards = getSameSuitCard()
        }
        if checkStraight(for: sameSuitCards) {
            return true
        }
        if isBackStraightFlush(sameSuitCards: sameSuitCards) {
            setTopForBackStraightFlush(suit: sameSuitCards[0].suit)
            return true
        }
        return false
    }

    private func getSameSuitCard() -> [Card] {
        for (key, value) in suitCounter where value >= 5 {
            return cards.filter { $0.suit == key }
        }
        return []
    }

    private mutating func checkStraight(for sameSuitCards: [Card]) -> Bool {
        var counter: Int = 0
        for i in 0..<sameSuitCards.count where i >= 1 {
            if sameSuitCards[i].rank.rawValue == sameSuitCards[i-1].rank.rawValue+1 {
                counter += 1
            }
            if counter >= 4 {
                top = sameSuitCards[i]
                return true
            }
        }
        return false
    }

    private func isBackStraightFlush(sameSuitCards: [Card]) -> Bool {
        var counter: Int = 0
        for card in sameSuitCards where card.rank == .ace || card.rank == .two || card.rank == .three || card.rank == .four || card.rank == .five {
            counter += 1
        }
        return counter == 5
    }

    private mutating func setTopForBackStraightFlush(suit: Card.Suit) {
        for card in cards where card.rank == .five && card.suit == suit {
            top = card
        }
    }

}
