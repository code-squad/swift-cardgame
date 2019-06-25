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

struct CardSet {
    private (set) var cards: [Card]
    private (set) var score: Int = 0
    private (set) var maxNumber: Int = 0

    init(cards: [Card]) {
        self.cards = cards
        self.score = judgeByRule().result.convertedScore
        self.maxNumber = judgeByRule().maxNumber
    }
    
    /// 카드덱을 불러오는 함수
    func getDeck() -> [Card]{
        return cards
    }

    /// 한 선수의 결과와 이때의 숫자를 반환하는 함수
    mutating func judgeByRule() -> (result: CardConsequence, maxNumber: Int) {
        let sortedDeck = sortCardDeck(of: cards)
        let cardSet = Set(sortedDeck)
        let pairAndNumber = countMaxPair(of: sortedDeck)
        let distinctedStraight = distinctStraight(of: sortedDeck)
        if distinctedStraight.result == true {
            return (result: .straight, maxNumber: distinctedStraight.maxNumber)
        } else if cardSet.count == sortedDeck.count-1, pairAndNumber.score == 2  {
            return (result: .onePair, maxNumber: pairAndNumber.maxNumber)
        } else if pairAndNumber.score == 3{
            return (result: .triple, maxNumber: pairAndNumber.maxNumber)
        } else if pairAndNumber.score == 4 {
            return (result: .fourCard, maxNumber: pairAndNumber.maxNumber)
        } else if cardSet.count != sortedDeck.count-1, pairAndNumber.score == 2 {
            return (result: .twoPair, maxNumber: pairAndNumber.maxNumber)
        } else {
            return (result: .noScore, maxNumber: sortedDeck[sortedDeck.endIndex-1])
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
    
    /// 한 원소당 같은 원소가 최대 몇개있는지 체크하고 최대 개수인 경우 숫자를 반환하는 함수
    private func countMaxPair(of cardNumbers: [Int]) -> (score: Int, maxNumber: Int) {
        var score = 0
        var maxNumber = 0
        for card in cardNumbers {
            let cardCount = cardNumbers.countElement(element: card)
            if score < cardCount {
                score = cardCount
                maxNumber = card
            }
        }
        return (score: score, maxNumber: maxNumber)
    }
    
    /// 카드덱에 5개 이상의 연속되는 숫자가 있는지 검사하고 이런 경우에서 가장 큰 숫자를 반환하는 함수
    private func distinctStraight(of cardNumbers: [Int]) -> (result: Bool, maxNumber: Int) {
        let cards = Array(Set(cardNumbers)).sorted()
        var distinctResult = (result: false, maxNumber: 0)
        if cards.count < 5 {
            return distinctResult
        } else {
            distinctResult = compareEachElement(cards: cards)
        }
        return distinctResult
    }
    
    /// 중복제거 후 원소가 5개 이상일때 각 숫자들이 연속하는지 검사하는 함수
    private func compareEachElement(cards: [Int]) -> (result: Bool, maxNumber: Int){
        var continuousNumber: Int = 0
        var distinctResult = (result: false, maxNumber: 0)
        for index in 1..<cards.count {
            if cards[index-1] + 1 == cards[index] {
                continuousNumber += 1
                distinctResult.maxNumber = cards[index]
            }
        }
        if continuousNumber >= 5 {
            distinctResult.result = true
        }
        return distinctResult
    }
    
    /// 카드의 결과와 가장 큰 수를 점수로 바꿔주는 함수
    func totalScore() -> Int {
        return score + maxNumber/100
    }
}
