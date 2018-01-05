//
//  HandEvaluator.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 28..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct HandEvaluator {
    private let hand: Hand
    
    init(hand: Hand) {
        self.hand = hand
    }
    
    func evaluateHand() -> HandType {
        let numbers = self.hand.cardsInformation.map() { $0.number }
        
        let isFlush = checkFlush(cards: self.hand.cardsInformation)
        let isStraight = checkStraight(numbers: numbers)
        let (isPair, pairNumbers) = checkGroup(numbers: numbers, count: 2)
        let (isThreeOfKind, threeOfKindNumbers) = checkGroup(numbers: numbers, count: 3)
        
        // 스트레이트 플러쉬
        guard !isFlush || !isStraight else { return HandType.straightFlush }
        
        // 포카드
        let (isFourOfKind, _) = checkGroup(numbers: numbers, count: 4)
        guard !isFourOfKind else { return HandType.fourOfKind }
        
        // 풀하우스
        let (isFullHouse, _) = checkGroup(numbers: threeOfKindNumbers, count: 2)
        guard !isPair || !isFullHouse else { return HandType.fullHouse }
        
        // 플러쉬
        guard !isFlush else { return HandType.flush }
        
        // 스트레이트
        guard !isStraight else { return HandType.straight }
        
        // 트리플페어
        guard !isThreeOfKind else { return HandType.threeOfKind }
        
        let (isTwoPair, _) = checkGroup(numbers: pairNumbers, count: 2)
        // 투페어
        guard !isPair || !isTwoPair else { return HandType.twoPair }
        
        // 원페어
        guard !isPair else { return HandType.pair }
        
        return HandType.highCard
    }
    
    private func checkFlush(cards: [Card]) -> Bool {
        let firstCard = cards[0]
        let sameSuit = cards.filter() { $0.suit == firstCard.suit }
        
        guard sameSuit.count == 5 else { return false }
        
        return true
    }
    
    private func checkStraight(numbers: [Number]) -> Bool {
        let sortedNumbers = numbers.flatMap { $0.straightValues }.sorted()
        
        guard sortedNumbers.count <= numbers.count + 1 else { return false }
        
        var lastNumber = sortedNumbers[0]
        var straightNumbers: [Int] = []
        
        straightNumbers.append(sortedNumbers[0])
        
        for i in 1..<sortedNumbers.count {
            if sortedNumbers[i] - lastNumber != 1 {
                straightNumbers = []
            }
            
            straightNumbers.append(sortedNumbers[i])
            lastNumber = sortedNumbers[i]
        }
        
        guard straightNumbers.count == 5 else { return false }
        
        return true
    }
    
    private func checkGroup(numbers: [Number], count: Int) -> (Bool, [Number]) {
        let frequency = figureOutNumberCount(numbers: numbers)
        let paired = frequency.filter ({ _, value in
                return value == count
            }).map({ key, _ in
                return key
            })
        
        guard paired.count > 0 else { return (false, []) }
        
        let pair = paired[0]
        let notPaired = numbers.map({ $0.rawValue }).filter({ $0 != pair }).sorted { $0 > $1 }
        let remainingNumbers = ([pair] + notPaired).map({ Number(rawValue: $0)! })
        
        return (true, remainingNumbers)
    }
    
    private func figureOutNumberCount(numbers: [Number]) -> [Int: Int] {
        return numbers.map({ $0.rawValue }).reduce([Int: Int]()) { number, count in
            var newNumber = number
            newNumber[count] = (newNumber[count] ?? 0) + 1
            return newNumber
        }
    }
}
