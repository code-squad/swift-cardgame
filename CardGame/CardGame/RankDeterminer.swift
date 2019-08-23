//
//  RankDeterminer.swift
//  CardGame
//
//  Created by 이진영 on 29/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct RankDeterminer {
    static func determineRank(cards: [Card]) -> (HandRank, Card) {
        let rankCounter = countRank(at: cards)
        
        if let card = checkStraight(rankCounter: rankCounter) {
            return (HandRank.straight, card)
        }
        
        var rank: [(Card, Int)] = []
        
        for i in (1...4).reversed() {
            rank = rankCounter.filter { $1 == i }
            
            if !rank.isEmpty {
                break
            }
        }
        
        let result = rank.removeLast()
        let resultCard = result.0
        let resultRank = result.1
        
        switch resultRank {
        case 4:
            return (HandRank.quads, resultCard)
        case 3:
            return (HandRank.trips, resultCard)
        case 2:
            return rank.count > 0 ? (HandRank.twoPairs, resultCard) : (HandRank.pair, resultCard)
        default:
            return (HandRank.highCard, resultCard)
        }
    }
    
    private static func countRank(at cards: [Card]) -> [(Card, Int)] {
        let rankCounter = cards.reduce([Card : Int](), { (cardCounter: [Card : Int], card: Card) -> [Card : Int] in
            var cardCounter = cardCounter
            cardCounter[card] = (cardCounter[card] ?? 0) + 1
            return cardCounter
        }).sorted(by: <)
        
        return rankCounter
    }
    
    private static func checkStraight(rankCounter: [(Card, Int)]) -> Card? {
        var result: [(Card, Int)] = []
        
        result.append(rankCounter[rankCounter.count - 1])
        
        for i in (0..<rankCounter.count - 1).reversed() {
            if result.count == 5 {
                break
            }
            
            if rankCounter[i + 1].0 == rankCounter[i].0 + 1 {
                result.append(rankCounter[i])
            } else {
                result.removeAll()
            }
        }
        
        return result.count < 5 ? nil : result.first?.0
    }
}
