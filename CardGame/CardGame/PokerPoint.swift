//
//  PokerPoint.swift
//  CardGame
//
//  Created by Eunjin Kim on 2017. 12. 29..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class PokerPoint {
    enum PokerHand: Int {
        case OnePair = 0, TwoPairs, Thrips, Straight, Flush, FullHouse, Quads, StraightFlush
    }
    enum PointType: Int {
        case PairPoint = 0, StraightPoint, FlushPoint
    }
    var scoreCard: [PointType:[Card]] // PairPoint, StraightPoint, FlushPoint
    var point: [PokerHand:Int]// OnePair, TwoPairs, Thrips, Straight, Flush, FullHouse, Quads, Straightflush
    init() {
        scoreCard = [PointType:[Card]]()
        scoreCard[.PairPoint] = [Card]()
        scoreCard[.StraightPoint] = [Card]()
        scoreCard[.FlushPoint] = [Card]()
        point = [PokerHand:Int]()
    }
    
    func incrementPoint(type: PokerHand) {
        point[type] = (point[type] ?? 0) + 1
    }
    
    func decrementPoint(type: PokerHand) {
        point[type] = (point[type] ?? 0) - 1
    }
    
    func checkForCardsHavePair(cards: [Card]) { // pair
        let cardsForPair = cards
        for pivotCard in cardsForPair {
            var countOfPair = 0
            for compareCard in cardsForPair {
                if pivotCard.isPairCard(cardOfPlayer: compareCard) && !compareCard.isCheckedCard(scoreCardOfPairPoint: scoreCard[.PairPoint]!) {
                    countOfPair += 1
                    scoreCard[.PairPoint]?.append(compareCard)
                }
            }
            if countOfPair == 1 {
                countOfPair = 0
                scoreCard[.PairPoint]?.removeLast()
            }
            countEachPairPoint(countOfPair: countOfPair)
        }
    }
    
    func countEachPairPoint(countOfPair: Int) {
        switch countOfPair { // OnePair, TwoPair, Thrips, Quads
            case 1:
                incrementPoint(type: .OnePair)
            case 2:
                incrementPoint(type: .TwoPairs)
            case 3:
                incrementPoint(type: .Thrips)
            case 4:
                incrementPoint(type: .Quads)
            default:
                break
        }
    }
    
    func checkForCardsHaveStraight(cards: [Card]) { // straight
        var cardsBySort = cards.sorted{$0 < $1}
        var pivotNumberOfCard = cardsBySort.removeFirst()
        scoreCard[.StraightPoint]?.append(pivotNumberOfCard)
        var countOfStraight = 1
        for card in cardsBySort {
            if pivotNumberOfCard.isStraightCard(cardOfPlayer: card) {
                countOfStraight += 1
                scoreCard[.StraightPoint]?.append(card)
            }else if countOfStraight >= 5 {
                incrementPoint(type: .Straight)
            }else {
                countOfStraight = 1
            }
            pivotNumberOfCard = card
        }
        if countOfStraight < 5 {
            scoreCard[.StraightPoint]?.removeAll()
        }
    }
    
    func checkForCardsHaveFlush(cards: [Card]) { // flush
        let cardsForShape = cards
        for pivotCard in cardsForShape {
            var countOfFlush = 0
            for compareCard in cardsForShape {
                if pivotCard.isFlushCard(cardOfPlayer: compareCard) {
                    countOfFlush += 1
                    scoreCard[.FlushPoint]?.append(compareCard)
                }
            }
            if countOfFlush >= 5 {
                incrementPoint(type: .Flush)
                break
            }else {
                scoreCard[.FlushPoint]?.removeAll()
            }
        }
        
    }
    
    func checkForFlushOrStraightFlush() {
        if isExistPoint(typeOfPokerHand: .OnePair) && isExistPoint(typeOfPokerHand: .Thrips) {
            incrementPoint(type: .FullHouse)
        }else if isExistPoint(typeOfPokerHand: .Straight) && isExistPoint(typeOfPokerHand: .Flush) {
            incrementPoint(type: .StraightFlush)
        }
    }

    func isExistPoint(typeOfPokerHand: PokerHand) -> Bool {
        return point[typeOfPokerHand] ?? 0 > 0
    }
    
    func calculatePokerPoint(cards: [Card]) -> Int {
        var pointOfResult = 0
        checkForCardsHavePair(cards: cards) // change this to method renaming
        checkForCardsHaveStraight(cards: cards)
        checkForCardsHaveFlush(cards: cards)
        checkForFlushOrStraightFlush()

        for (index, pointOfPokerHand) in point.enumerated() {
            let nextIndex = index + 1
            pointOfResult += pointOfPokerHand.value * nextIndex // PokerHand 별 가중치
        }
        for score in scoreCard {
            for card in score.value {
                pointOfResult += card.plusPointCardData()
            }
        }
        
        /// 플레이어 별 점수 확인
        print(pointOfResult)
        print("Pair: \(scoreCard[.PairPoint] ?? [])")
        print("Straight: \(scoreCard[.StraightPoint] ?? [])")
        print("Flush: \(scoreCard[.FlushPoint] ?? [])")
        print("point: \(point)")
        print()
        return pointOfResult
        ///
    }
    
}
