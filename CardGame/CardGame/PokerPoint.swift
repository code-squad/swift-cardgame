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
        case OnePair, TwoPairs, Thrips, Straight, Flush, FullHouse, Quads, Straightflush
    }
    enum PointType: Int {
        case PairPoint, StraightPoint, FlushPoint
    }
    var point: [Int] // OnePair, TwoPairs, Thrips, Straight, Flush, FullHouse, Quads, Straightflush
    var scoreCard: [[Card]] // PairPoint, StraightPoint, FlushPoint
    init() {
        scoreCard = [[Card]]()
        point = [Int](repeating: 0, count: 8)
    }
    
    func incrementPoint(type: PokerHand) {
        point[type.rawValue] += 1
    }
    
    func decrementPoint(type: PokerHand) {
        point[type.rawValue] -= 1
    }
    
    func cardOfSameNumber(cards: [Card]) { // pair
        let numberOfCard = Set(cards.map({$0.number}))
        scoreCard.append([Card]())
        for fibotCard in numberOfCard {
            var countOfPair = 0
            for index in 0..<cards.count {
                if fibotCard == cards[index].number {
                    scoreCard[PointType.PairPoint.rawValue].append(cards[index])
                    countOfPair += 1
                }
            }
            countEachPairPoint(countOfPair: countOfPair)
        }
    }
    
    func countEachPairPoint(countOfPair: Int) {
        if countOfPair > 1 && countOfPair < 5 { // OnePair, TwoPair, Thrips
            incrementPoint(type: PokerHand.OnePair)
        }else if point[PokerHand.OnePair.rawValue] > 1 {
            incrementPoint(type: PokerHand.TwoPairs)
            decrementPoint(type: PokerHand.OnePair)
            decrementPoint(type: PokerHand.OnePair)
        }
    }
    
    func cardOfSerial(cards: [Card]) { // straight
        let cardsBySort = cards.sorted{$0.number.rawValue < $1.number.rawValue}
        var fibotNumberOfCard = cardsBySort[0].number.rawValue
        var countOfStraight = 0
        scoreCard.append([Card]())
        for index in 1..<cardsBySort.count {
            if fibotNumberOfCard == cardsBySort[index].number.rawValue {
                scoreCard[PointType.StraightPoint.rawValue].append(cardsBySort[index])
                fibotNumberOfCard += 1
                countOfStraight += 1
                if countOfStraight >= 5 {
                    incrementPoint(type: PokerHand.Straight)
                }
            }
        }
    }
    
    func cardOfSameShape(cards: [Card]) { // flush
        let shapeOfCard = Set(cards.map({$0.shape}))
        scoreCard.append([Card]())
        for fibotCard in shapeOfCard {
            var countOfFlush = 0
            for index in 0..<cards.count {
                if fibotCard == cards[index].shape {
                    scoreCard[PointType.FlushPoint.rawValue].append(cards[index])
                    countOfFlush += 1
                }
                if countOfFlush >= 5 {
                    incrementPoint(type: PokerHand.Flush)
                }
            }
        }
    }
    
    func calculatePokerPoint(cards: [Card]) -> Int {
        var pointOfResult = 0
        cardOfSameNumber(cards: cards)
        cardOfSerial(cards: cards)
        cardOfSameShape(cards: cards)
        if point[PokerHand.OnePair.rawValue] > 0 && point[PokerHand.Thrips.rawValue] > 0 {
            incrementPoint(type: PokerHand.FullHouse)
            decrementPoint(type: PokerHand.OnePair)
            decrementPoint(type: PokerHand.Thrips)
        }else if point[PokerHand.Straight.rawValue] > 0 && point[PokerHand.Flush.rawValue] > 0 {
            incrementPoint(type: PokerHand.Straightflush)
            decrementPoint(type: PokerHand.Straight)
            decrementPoint(type: PokerHand.Flush)
        }
        for index in 0..<point.count {
            pointOfResult += point[index] * (index + 1)
        }
        for index in 0..<point.count {
            print(point[index], terminator: " ")
        }
        print()
        return pointOfResult
    }
    
}
