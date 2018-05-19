//
//  PokerHands.swift
//  CardGame
//
//  Created by moon on 2018. 5. 17..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct PokerHands {

    /// 로열 스트레이트 플러시
    func hasRoyalStraightFlush(_ cards: [Card]) -> Bool {
        var result: Bool = false
        // 같은 모양 5개가 있는지 확인
        for suit in Card.Suit.allCases {
            // 같은 모양의 카드를 모아두는 배열
            var sameSuitCards: [Card] = [Card]()
            for card in cards {
                if card.isSameSuit(suit) {
                    sameSuitCards.append(card)
                }
            }
            // 같은 모양의 카드가 A, K, Q, J, 10가 있는지 확인
            if sameSuitCards.count >= 5 {
                if sameSuitCards[0].isSameNumber(.ace) &&
                    sameSuitCards[1].isSameNumber(.king) &&
                    sameSuitCards[2].isSameNumber(.queen) &&
                    sameSuitCards[3].isSameNumber(.jack) &&
                    sameSuitCards[4].isSameNumber(.ten) {
                    result = true
                }
            }
        }
        return result
    }
    
    /// 백스트레이트 플러시
    func hasBackStraightFlush(_ cards: [Card]) -> Bool {
        var result: Bool = false
        // 같은 모양 5개가 있는지 확인
        for suit in Card.Suit.allCases {
            // 같은 모양의 카드를 모아두는 배열
            var sameSuitCards: [Card] = [Card]()
            for card in cards {
                if card.isSameSuit(suit) {
                    sameSuitCards.append(card)
                }
            }
            // 같은 모양의 카드가 A, 2, 3, 4, 5가 있는지 확인
            if sameSuitCards.count >= 5 {
                if sameSuitCards.contains(Card(suit: suit, number: .ace)) &&
                    sameSuitCards.contains(Card(suit: suit, number: .two)) &&
                    sameSuitCards.contains(Card(suit: suit, number: .three)) &&
                    sameSuitCards.contains(Card(suit: suit, number: .four)) &&
                    sameSuitCards.contains(Card(suit: suit, number: .five)) {
                    result = true
                }
            }
        }
        return result
    }
    
    /// 스트레이트 플러시
    func hasStraightFlush(_ cards: [Card]) -> Bool {
        // 같은 모양 5개가 있는지 확인
        var result: Bool = false
        for suit in Card.Suit.allCases {
            // 같은 모양의 카드를 모아두는 배열
            var sameSuitCards: [Card] = [Card]()
            for card in cards {
                if card.isSameSuit(suit) {
                    sameSuitCards.append(card)
                }
            }
            // 같은 모양의 카드가 5개가 연속인지 확인
            if self.hasStraight(sameSuitCards) {
                result = true
            }
        }
        return result
    }
    
    /// 포카드
    func hasFourCard(_ cards: [Card]) -> Bool {
        var result: Bool = false
        // 같은 숫자 4개가 있는지 확인
        for number in Card.Number.allCases {
            // 같은 숫자의 카드를 모아두는 배열
            var sameNumberCards: [Card] = [Card]()
            for card in cards {
                if card.isSameNumber(number) {
                    sameNumberCards.append(card)
                }
            }
            if sameNumberCards.count >= 4 {
                result = true
            }
        }
        return result
    }
    
    /// 풀하우스
    func hasFullHous(_ cards: [Card]) -> Bool {
        var numberDictionary = [Card.Number:[Card]]()
        for number in Card.Number.allCases {
            var sameNumbers = [Card]()
            for card in cards {
                if card.isSameNumber(number) {
                    sameNumbers.append(card)
                }
            }
            numberDictionary[number] = sameNumbers
        }
        
        var hasTriple = false
        var hasOnePair = false
        
        for number in Card.Number.allCases {
            guard let countOfNumber = numberDictionary[number]?.count else {
                continue
            }
            if countOfNumber >= 3 {
                hasTriple = true
            } else if countOfNumber >= 2 {
                hasOnePair = true
            }
        }
        
        return hasTriple && hasOnePair
        
    }
    
    // 플러시
    func hasFlush(_ cards: [Card]) -> Bool {
        var result: Bool = false
        // 같은 모양 5개가 있는지 확인
        for suit in Card.Suit.allCases {
            // 같은 모양의 카드를 모아두는 배열
            var sameSuitCards: [Card] = [Card]()
            for card in cards {
                if card.isSameSuit(suit) {
                    sameSuitCards.append(card)
                }
            }
            // 같은 모양이 5개인지
            if sameSuitCards.count >= 5 {
                result = true
            }
           
        }
        return result
    }
    
    // 마운틴 A, K, Q, J, 10
    func hasMountain(_ cards: [Card]) -> Bool {
        var result: Bool = false
        if cards[0].isSameNumber(.ace) &&
            cards[1].isSameNumber(.king) &&
            cards[2].isSameNumber(.queen) &&
            cards[3].isSameNumber(.jack) &&
            cards[4].isSameNumber(.ten) {
            result = true
        }
        return result
    }
    
    // 스트레이트
    func hasStraight(_ cards: [Card]) -> Bool {
        // 숫자 연속 5개 체크
        var result: Bool = false
        var continueCount: Int = 0
        for index in 0..<cards.count-1 {
            if cards[index].isContinousNumber(cards[index+1]) {
                continueCount += 1
            } else {
                // 연속된게 5개 이상이면 true
                if continueCount >= 4 {
                    result = true
                }
                // 아니면 다시 체크 시작
                continueCount = 0
            }
        }
        return result
    }
    
    // 트리플
    func hasTriple(_ cards: [Card]) -> Bool {
        var result: Bool = false
        // 같은 숫자 3개가 있는지 확인
        for number in Card.Number.allCases {
            // 같은 숫자의 카드를 모아두는 배열
            var sameNumberCards: [Card] = [Card]()
            for card in cards {
                if card.isSameNumber(number) {
                    sameNumberCards.append(card)
                }
            }
            if sameNumberCards.count >= 3 {
                result = true
            }
        }
        return result
    }
    
    // 투페어
    func hasTwoPair(_ cards: [Card]) -> Bool {
        var result: Bool = false
        var pairCount: Int = 0
        for number in Card.Number.allCases {
            var sameNumberCards: [Card] = [Card]()
            for card in cards {
                if card.isSameNumber(number) {
                    sameNumberCards.append(card)
                }
            }
            if sameNumberCards.count >= 2 {
                pairCount += 1
            }
        }
        if pairCount >= 2 { result = true }
        return result
    }
    
    // 원페어
    func hasOnePair(_ cards: [Card]) -> Bool {
        var result: Bool = false
        for number in Card.Number.allCases {
            var sameNumberCards: [Card] = [Card]()
            for card in cards {
                if card.isSameNumber(number) {
                    sameNumberCards.append(card)
                }
            }
            if sameNumberCards.count >= 2 {
                result = true
            }
        }
        return result
    }
    
}
