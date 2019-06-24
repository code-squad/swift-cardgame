//
//  CardResult.swift
//  CardGame
//
//  Created by jang gukjin on 22/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//
/*
 원페어 = 가진 카드 중 두 카드 숫자가 같은 경우
 투페어 = 가진 카드 중 두 카드 숫자가 같은 경우가 두 가지 이상
 트리플 = 가진 카드 중 세 카드 숫자가 같은 경우
 스트레이트 = 가진 카드 중 다섯 카드 숫자가 연속 번호인 경우
 포카드 = 가진 카드 중 네 카드 숫자가 같은 경우
 페어가 없을 경우 또는 같은 핸즈인 경우 숫자가 높은 카드를 가진 사람이 우승한다.
 */

import Foundation


extension Array where Element == Int {
    /// 파라미터로 받은 원소가 해당 배열에 몇개 있는지 카운트하는 함수
    func countElement(element: Int) -> Int{
        var score:Int = 0
        for part in self {
            if part == element {
                score += 1
            }
        }
        return score
    }
}

struct CardResult {
    /// 한 선수의 결과를 반환하는 함수
    func judgeByRule(of cards: [Card]) -> CardConsequence {
        let sortedDeck = sortCardDeck(of: cards)
        let cardSet = Set(sortedDeck)
        let score = countMaxPair(of: sortedDeck)
        if cardSet.count == sortedDeck.count-1 {
            return .onePair
        } else if score == 3{
            return .triple
        } else if score == 4 {
            return .fourCard
        } else if cardSet.count != sortedDeck.count-1, score == 2 {
            return .twoPair
        } else if distinctStraight(of: sortedDeck) == true {
            return .straight
        } else {
            return .noScore
        }
    }
    
    /// 카드덱에 숫자만 뽑아서 정렬해주는 함수
    private func sortCardDeck(of cards: [Card]) -> [Int] {
        var sortedDeck = [Int]()
        for card in cards {
            sortedDeck.append(card.rank.rawValue)
        }
        return sortedDeck.sorted()
    }
    
    /// 한 원소당 같은 원소가 최대 몇개있는지 체크하는 함수
    private func countMaxPair(of cardNumbers: [Int]) -> Int {
        var score = 0
        for card in cardNumbers {
            let cardCount = cardNumbers.countElement(element: card)
            if score < cardCount {
                score = cardCount
            }
        }
        return score
    }
    
    /// 카드덱에 5개 이상의 연속되는 숫자가 있는지 검사하는 함수
    private func distinctStraight(of cardNumbers: [Int]) -> Bool {
        var continuousNumber: Int = 0
        var distinctResult: Bool = false
        for index in 1..<cardNumbers.count {
            if cardNumbers[index-1] + 1 == cardNumbers[index] {
                    continuousNumber += 1
            }
        }
        if continuousNumber >= 5 {
            distinctResult = true
        }
        return distinctResult
    }
}
