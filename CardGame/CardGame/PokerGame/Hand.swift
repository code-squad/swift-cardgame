//
//  Hand.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 28..
//  Copyright © 2017년 YUAMING. All rights reserved.
//

import Foundation

struct Hand {
    private let cards: [Card]
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    var count: Int {
        return self.cards.count
    }
    
    var cardsInformation: [Card] {
        return self.cards
    }
    
    func giveScore() -> HandType {
        let isFlush = checkFlush()
        let isStraight = checkStraight()
        let (isPair, pairNumbers) = checkGroup(count: 2)
        let (isThreeOfKind, threeOfKindNumbers) = checkGroup(count: 3)
        let (isFourOfKind, _) = checkGroup(count: 4)
        let (isFullHouse, _) = checkGroup(numbers: threeOfKindNumbers, count: 2)
        let (isTwoPair, _) = checkGroup(numbers: pairNumbers, count: 2)
        
        switch true {
        case isFlush && isStraight:
            return HandType.straightFlush
        case isFourOfKind:
            return HandType.fourOfKind
        case isPair && isFullHouse:
            return HandType.fullHouse
        case isFlush:
            return HandType.flush
        case isStraight:
            return HandType.straight
        case isThreeOfKind:
            return HandType.threeOfKind
        case isPair && isTwoPair:
            return HandType.twoPair
        case isPair:
            return HandType.pair
        default:
            return HandType.highCard
        }
    }
}

typealias HandScore = Hand

private extension HandScore {
    var numbers: [Number] {
        return self.cards.map({ $0.number })
    }
    
    func checkFlush() -> Bool {
        let firstCard = self.cards[0]
        let sameSuit = self.cards.filter({ $0.suit == firstCard.suit })
        return sameSuit.count >= 5
    }
    
    func checkStraight() -> Bool {
        let sortedNumbers = self.numbers.flatMap({ $0.straightValues }).sorted()

        guard sortedNumbers.count <= self.numbers.count + 1 else { return false }

        var lastNumber = sortedNumbers[0]
        var straightNumbers: [Int] = [lastNumber]

        for index in 1..<sortedNumbers.count {
            if sortedNumbers[index] - lastNumber != 1 {
                straightNumbers = []
            }

            lastNumber = sortedNumbers[index]
            straightNumbers.append(lastNumber)
        }

        return straightNumbers.count >= 5
    }
    
    func checkGroup(count: Int) -> (Bool, [Number]) {
        let frequency = figureOutNumberCount(numbers: self.numbers)
        let paired = frequency.filter({ _, value in
            value == count
        }).map({ key, _ in
            key
        })

        guard paired.count > 0 else { return (false, []) }

        let pair = paired[0]
        let notPaired = self.numbers.filter({ $0 != pair })
        let remainingNumbers = [pair] + notPaired

        return (true, remainingNumbers)
    }
    
    func checkGroup(numbers: [Number], count: Int) -> (Bool, [Number]) {
        let frequency = figureOutNumberCount(numbers: numbers)
        let paired = frequency.filter({ _, value in
            value == count
        }).map({ key, _ in
            key
        })
        
        guard paired.count > 0 else { return (false, []) }
        
        let pair = paired[0]
        let notPaired = numbers.filter({ $0 != pair })
        let remainingNumbers = [pair] + notPaired
        
        return (true, remainingNumbers)
    }
    
    func figureOutNumberCount(numbers: [Number]) -> [Number: Int] {
        return numbers.map({ $0 }).reduce([Number: Int]()) { number, count in
            var newNumber = number
            newNumber[count] = (newNumber[count] ?? 0) + 1
            return newNumber
        }
    }
}

extension Hand: Equatable {
    static func == (lhs: Hand, rhs: Hand) -> Bool {
        return lhs.cards.sorted() == rhs.cards.sorted()
    }
}

extension Hand: CustomStringConvertible {
    var description: String {
        return self.cards.reduce(" -> ") { $0 + $1.description + " " }
    }
}
