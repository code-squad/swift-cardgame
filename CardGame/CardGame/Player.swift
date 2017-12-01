//
//  Player.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 28..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class Player {
    let name: String
    private(set) var cards: Array<Card> = []
    private(set) var top: Card?

    init(name: String) {
        self.name = name
    }

    enum PokerHands: Int {
        case none
        case onePair, twoPair // 숫자가 같은 카드 2장 1세트, 2세트 이상
        case threeOfAKind // 숫자가 같은 카드 3장.(트리플)
        case straight // 숫자가 연속된 카드 5장
        case flush // 숫자 상관없이 무늬가 같은 카드 5장.
        case fullHouse // 트리플과 원 페어가 같이 존재.
        case fourOfAKind // 숫자가 같은 카드 4장.(포카드)
        case straightFlush // 숫자가 연속되고 무늬가 같은 카드 5장.
    }

    func callNewCard(_ card: Card) {
        cards.append(card)
        cards.sort()
    }

    func showDown() -> PokerHands {
        if isStraightFlush() {
            return .straightFlush
        } else if isFourOfAKind() {
            return .fourOfAKind
        } else if isFullHouse() {
            return .fullHouse
        } else if isFlush() {
            return .flush
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

}

private typealias ShowDown = Player

private extension ShowDown {

    func countSameRank() -> [Card.Rank:Int] {
        var counter: [Card.Rank:Int] = [:]
        for card in cards {
            if counter[card.rank] == nil {
                counter[card.rank] = 1
            } else {
                counter[card.rank]! += 1
                top = card
            }
        }
        return counter
    }

    func countSameSuit() -> [Card.Suit:Int] {
        var counter: [Card.Suit:Int] = [:]
        for card in cards {
            if counter[card.suit] == nil {
                counter[card.suit] = 1
            } else {
                counter[card.suit]! += 1
                top = card
            }
        }
        return counter
    }

    func isOnePair() -> Bool {
        var pairCounter: Int = 0
        let counter = countSameRank()
        for (_, value) in counter where value == 2 {
            pairCounter += 1
        }
        return pairCounter == 1
    }

    func isTwoPair() -> Bool {
        var pairCounter: Int = 0
        let counter = countSameRank()
        for (_, value) in counter where value == 2 {
            pairCounter += 1
        }
        return pairCounter >= 2
    }

    func isThreeOfAKind() -> Bool {
        let counter = countSameRank()
        for (_, value) in counter where value == 3 {
            return true
        }
        return false
    }

    func isStraight() -> Bool {
        var counter: Int = 0
        for i in 1..<cards.count {
            if cards[i].rank.rawValue == (cards[i-1].rank.rawValue + 1) {
                counter += 1
                top = cards[i]
                if counter >= 4 { return true }
            } else if cards[i].rank.rawValue == cards[i-1].rank.rawValue {
                top = cards[i]
            } else {
                counter = 0
            }
        }
        return false
    }

    func isBackStraight() -> Bool {
        var counter: [Card.Rank:Int] = [:]
        for card in cards where card.rank == .ace || card.rank == .two || card.rank == .three || card.rank == .four || card.rank == .five {
            counter[card.rank] = (counter[card.rank] ?? 1) + 1
            top = card
        }
        return counter.count == 5
    }

    func isFlush() -> Bool {
        let counter = countSameSuit()
        for (_, value) in counter where value >= 5 {
            return true
        }
        return false
    }

    func isFullHouse() -> Bool {
        return isThreeOfAKind() && isOnePair()
    }

    func isFourOfAKind() -> Bool {
        let counter = countSameRank()
        for (_, value) in counter where value == 4 {
            return true
        }
        return false
    }

    func isStraightFlush() -> Bool {
        var counter: Int = 0
        for i in 1..<cards.count {
            if (cards[i].suit == cards[i-1].suit) && (cards[i].rank.rawValue == cards[i-1].rank.rawValue+1) {
                counter += 1
                top = cards[i]
                if counter >= 4 { return true }
            } else if cards[i].rank.rawValue == cards[i-1].rank.rawValue {
                top = cards[i]
            } else {
                counter = 0
            }
        }
        return false
    }

}
