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
        case OnePair = 0, TwoPairs, Thrips, Straight, Flush, FullHouse, Quads, Straightflush
    }
    enum PointType: Int {
        case PairPoint = 0, StraightPoint, FlushPoint
    }
    var scoreCard: [PointType:Card] // PairPoint, StraightPoint, FlushPoint
    var point: [PokerHand:Int]// OnePair, TwoPairs, Thrips, Straight, Flush, FullHouse, Quads, Straightflush
    init() {
        scoreCard = [PointType:Card]()
        point = [PokerHand:Int]()
    }
    
    func incrementPoint(type: PokerHand) {
        point[type] = (point[type] ?? 0) + 1
    }
    
    func decrementPoint(type: PokerHand) {
        point[type] = (point[type] ?? 0) - 1
    }
    
    func cardOfSameNumber(cards: [Card]) { // pair
        let numberOfCard = Set(cards.map({$0.number}))
        for pivotCard in numberOfCard {
            var countOfPair = 0
            for index in 0..<cards.count {
                if pivotCard == cards[index].number {
                    scoreCard[.PairPoint] = cards[index]
                    countOfPair += 1
                }
            }
            countEachPairPoint(countOfPair: 2)
        }
    }
    
    func countEachPairPoint(countOfPair: Int) {
        if countOfPair > 1 && countOfPair < 5 { // OnePair, TwoPair, Thrips
            incrementPoint(type: PokerHand.OnePair)
        }else if (point[.OnePair] ?? 0) > 1 {
            incrementPoint(type: .TwoPairs)
            decrementPoint(type: .OnePair)
            decrementPoint(type: .OnePair)
        }
    }
    
    func cardOfSerial(cards: [Card]) { // straight
        var cardsBySort = cards.sorted{$0 < $1}
        var pivotNumberOfCard = cardsBySort.removeFirst()
        
        var countOfStraight = 0
        for card in cardsBySort {
            if pivotNumberOfCard.compareSortCard(cardOfPlayer: card) {
                countOfStraight += 1
            }else {
                countOfStraight = 0
            }
            pivotNumberOfCard = card
            
            if countOfStraight >= 5 {
                incrementPoint(type: .Straight)
            }
        }
    }
    
    func cardOfSameShape(cards: [Card]) { // flush
        let shapeOfCard = Set(cards.map({$0.shape}))
        for pivotCard in shapeOfCard {
            var countOfFlush = 0
            for index in 0..<cards.count {
                if pivotCard == cards[index].shape {
                    scoreCard[.FlushPoint] = cards[index]
                    countOfFlush += 1
                }
                if countOfFlush >= 5 {
                    incrementPoint(type: .Flush)
                }
            }
        }
    }
    
    func calculatePokerPoint(cards: [Card]) -> Int {
        var pointOfResult = 0
        cardOfSameNumber(cards: cards)
        cardOfSerial(cards: cards)
        cardOfSameShape(cards: cards)
        if (point[.OnePair] ?? 0) > 0 && (point[.Thrips] ?? 0) > 0 {
            incrementPoint(type: .FullHouse)
            decrementPoint(type: .OnePair)
            decrementPoint(type: .Thrips)
        }else if (point[.Straight] ?? 0) > 0 && (point[.Flush] ?? 0) > 0 {
            incrementPoint(type: .Straightflush)
            decrementPoint(type: .Straight)
            decrementPoint(type: .Flush)
        }
        for (index, pointOfPokerHand) in point.enumerated() {
            let nextIndex = index + 1
            pointOfResult += pointOfPokerHand.value * nextIndex
        }
        print(pointOfResult, scoreCard)
        return pointOfResult
    }
    
}
