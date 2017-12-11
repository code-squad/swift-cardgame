//
//  CalculatePoint.swift
//  CardGame
//
//  Created by Mrlee on 2017. 12. 8..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct PokerHand {
    enum PokerRank: Int {
        case highCard = 100
        case onePair = 200
        case twoPair = 300
        case threeOfKind = 400
        case straight = 500
        case royalStraight = 600
        case flush = 700
        case fullhouse = 800
        case fourOfKind = 900
        case straightFlush = 1000
        case royalStraightFlush = 1100
    }
    
    mutating func makePokerHandRanking(_ cards: [[Card]]) -> ([PokerRank], [Int]) {
        var resultOfHand = [PokerRank]()
        var resultOfPoint = [Int]()
        for cardStack in cards {
            let result = sortStackOfPlayer(cardStack)
            resultOfHand.append(result.0)
            resultOfPoint.append(result.1)
        }
        return (resultOfHand, resultOfPoint)
    }
    
    private func sortStackOfPlayer(_ stack: [Card]) -> (PokerRank, Int) {
        var pointTable = Array(repeating: 0, count: 14)
        for i in 0..<stack.count {
            let value = stack[i].rank.rawValue
            if value == "Ace" {
                pointTable[1] += 1
            } else if value == "J" {
                pointTable[11] += 1
            } else if value == "Q" {
                pointTable[12] += 1
            } else if value == "K" {
                pointTable[13] += 1
            } else {
                pointTable[Int(value)!] += 1
            }
        }
        return selectPokerHand(table: pointTable, cards: stack)
    }
    
    private func separateRowHand(table: [Int], cards stack: [Card]) -> (hand: Int, point: Int) {
        var resultOfHand = 0
        var point = 0
        for index in 1..<table.count {
            if table[index] == 2 {
                point += index * 2 + calculateOnePair(tableIndex: index, cards: stack)
                resultOfHand += 200
            }
            if table[index] == 3 {
                point += index * 3
                resultOfHand += 300
            }
            if table[index] == 4 {
                point += index * 4
                resultOfHand += 900
            }
        }
        return (resultOfHand, point)
    }
    
    private func calculateOnePair(tableIndex index: Int, cards stack: [Card]) -> Int {
        var point = 0
        for i in 0..<stack.count {
            if stack[i].rank.hashValue + 1 == index {
                point += stack[i].suit.hashValue + 1
            }
        }
        return point
    }
    
    private func calculateHighCard(_ stack: [Card]) -> Int {
        let sortedCard = stack.sorted(by: <)
        var point = 0
        let hightCard = sortedCard[sortedCard.index(before: sortedCard.endIndex)]
        let value = hightCard.rank.rawValue
        
        switch value {
        case "Ace":
            point += 1
        case "J":
            point += 11
        case "Q":
            point += 12
        case "K":
            point += 13
        default:
            point += Int(value)!
        }
        
        for suitIndex in 0..<Card.Suit.allValues.count {
            if Card.Suit.allValues[suitIndex] == hightCard.suit {
                point += suitIndex + 1
            }
        }
        return point
    }
    
    private func separateHighHand(table: [Int], cards stack:[Card]) -> (PokerRank, Int)? {
        let flush = calculateFlushType(of: stack)
        let straigth = calculateStraight(of: table)
        if (flush != nil) && (straigth == PokerRank.straight) {
            return (PokerRank.straightFlush, PokerRank.straightFlush.rawValue + flush!.1)
        } else if (flush != nil) && (straigth == PokerRank.royalStraight) {
            return (PokerRank.royalStraightFlush, 0)
        }
        if (flush != nil && straigth == nil) {
            return (PokerRank.flush, PokerRank.straightFlush.rawValue + flush!.1)
        }
        if (flush == nil && straigth != nil) {
            return (straigth!, 0) // Straigth Or Royal Straigth
        }
        return nil
    }
    
    private func selectPokerHand(table pointTable: [Int], cards stack:[Card]) -> (PokerRank, Int) {
        let resultScore = separateRowHand(table: pointTable, cards: stack)

        switch resultScore.hand {
        case 200:
            return (PokerRank.onePair, PokerRank.onePair.rawValue + resultScore.point)
        case 300:
            return (PokerRank.threeOfKind, PokerRank.threeOfKind.rawValue + resultScore.point)
        case 400:
            return (PokerRank.twoPair, PokerRank.twoPair.rawValue + resultScore.point)
        case 500:
            return (PokerRank.fullhouse, PokerRank.fullhouse.rawValue)
        case 900:
            return (PokerRank.fourOfKind, PokerRank.fourOfKind.rawValue + resultScore.point)
        default:
            // resultScore.hand의 값이 0이란것은 스트레이트 이거나, highCard 라는 뜻, 밑의 바인딩을 통해 높은 hand의 패가 아니면 highCard로 return
            if let highScoreHand = separateHighHand(table: pointTable, cards: stack) {
                return highScoreHand
            }
            return (PokerRank.highCard, calculateHighCard(stack))
        }
    }
    
    private func calculateStraight(of pointTable: [Int]) -> PokerRank? {
        var cardValue = 0
        for index in 0..<pointTable.count {
            if cardValue == 5 { break }
            if pointTable[index] == 1 {
                cardValue += 1
            } else if pointTable[index] == 0 && cardValue != 0 {
                cardValue -= 1
            }
        }
        if cardValue == 4 && pointTable[1] == 1 {
            return PokerRank.royalStraight
        }
        if cardValue == 5 {
            return PokerRank.straight
        }
        return nil
    }
    
    private func calculateFlushType(of stack: [Card]) -> (PokerRank, Int)? {
        if let frushSuitIndex = countSuit(stack).index(of: 5) {
            return (PokerRank.flush, (Int(frushSuitIndex) + 1))
        }
        return nil
    }
    
    private func countSuit(_ stack: [Card]) -> [Int] {
        var countOfSuit = [0,0,0,0]
        for card in stack {
            switch card.suit {
            case .spades:
                countOfSuit[3] += 1
            case .diamonds:
                countOfSuit[2] += 1
            case .hearts:
                countOfSuit[1] += 1
            case .clubs:
                countOfSuit[0] += 1
            }
        }
        return countOfSuit
    }
}
