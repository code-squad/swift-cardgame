//
//  PokerPoint.swift
//  CardGame
//
//  Created by Eunjin Kim on 2017. 12. 29..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class PokerScoreCalculate {
    var scoreCard: [[Card]] // 0: pairPoint, 1: straightPoint, 2: flushPoint
    // 0: OnePair, 1: TwoPairs, 2: Thrips, 3: Straight, 4: Flush, 5: FullHouse, 6: Quads, 7: Straight flush
    var point: [Int]
    init() {
        scoreCard = [[Card]]()
        point = [Int](repeating: 0, count: 8)
    }
    func cardOfSameNumber(cards: [Card]) { // pair
        let numberOfCard = Set(cards.map({$0.number}))
        scoreCard.append([Card]())
        for fibotCard in numberOfCard {
            var countOfPair = 0
            for index in 0..<cards.count {
                if fibotCard == cards[index].number {
                    scoreCard[0].append(cards[index])
                    countOfPair += 1
                }
            }
            countEachPairPoint(countOfPair: countOfPair)
        }
    }
    
    func countEachPairPoint(countOfPair: Int) {
        if countOfPair == 2 { // OnePair
            point[0] += 1
        }else if countOfPair == 3 { // Thrips
            point[2] += 1
        }else if countOfPair == 4 { // Four card
            point[6] += 1
        }else if point[0] > 1 {
            point[1] += 1
            point[0] -= 2
        }
    }
    
    func cardOfSerial(cards: [Card]) { // straight
        let cardsBySort = cards.sorted{$0.number.rawValue < $1.number.rawValue}
        var fibotNumberOfCard = cardsBySort[0].number.rawValue
        var countOfStraight = 0
        scoreCard.append([Card]())
        for index in 1..<cardsBySort.count {
            if fibotNumberOfCard == cardsBySort[index].number.rawValue {
                scoreCard[1].append(cardsBySort[index])
                fibotNumberOfCard += 1
                countOfStraight += 1
                if countOfStraight >= 5 {
                    point[3] += 1
                }
            }
        }
    }
    
    func cardOfSameShape(cards: [Card]) { // flush
        let shapeOfCard = Set(cards.map({$0.shape}))
        var countOfFlush = 0
        scoreCard.append([Card]())
        for fibotCard in shapeOfCard {
            for index in 0..<cards.count {
                if fibotCard == cards[index].shape {
                    scoreCard[2].append(cards[index])
                    countOfFlush += 1
                }
                if countOfFlush >= 5 {
                    point[4] += 1
                }
            }
        }
    }
    
    func calculatePokerPoint(cards: [Card]) -> Int {
        var pointOfResult = 0
        cardOfSameNumber(cards: cards)
        cardOfSerial(cards: cards)
        cardOfSameShape(cards: cards)
        if point[0] == 1 && point[2] == 1 {
            point[5] += 1
            point[0] -= 1
            point[2] -= 1
        }else if point[3] == 1 && point[4] == 1 {
            point[7] += 1
            point[3] -= 1
            point[4] -= 1
        }
        for index in 0..<point.count {
            pointOfResult += point[index] * (index + 1)
        }
        return pointOfResult
    }
    
}
