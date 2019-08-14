//
//  RankDeterminer.swift
//  CardGame
//
//  Created by 이진영 on 29/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct RankDeterminer {
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
        
        for i in (0..<rankCounter.count - 1).reversed() {
            if result.count == 5 {
                break
            }
            
            if rankCounter[i + 1].0.isConsecutive(card: rankCounter[i].0) {
                result.append(rankCounter[i])
            } else {
                result.removeAll()
            }
        }
        
        return result.count < 5 ? nil : result.last?.0
    }
}
