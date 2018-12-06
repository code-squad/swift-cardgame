//
//  Deck.swift
//  CardGame
//
//  Created by 김장수 on 03/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct CardDeck {
    private var trumps = [Trump]()
    
    mutating func reset() {
        let suits = Suits.allCases
        let rank = Rank.allCases
        self.trumps = [Trump]()
        
        for mark in suits {
            for num in rank {
                self.trumps.append(Trump(suits: mark.rawValue, rank: num.rawValue))
            }
        }
        self.shuffle()
    }
    
    mutating func shuffle() {
        for i in 0..<self.trumps.count {
            let j = Int(arc4random_uniform(UInt32(self.trumps.count - i))) + i
            self.trumps.swapAt(i, j)
        }
    }
    
    mutating func removeOne() -> CustomStringConvertible {
        return self.trumps.removeFirst()
    }
    
    func count() -> Int {
        return self.trumps.count
    }
    
    mutating func drawCardStud(of cards: Int) -> [Trump] {
        var stud = [Trump]()
        
        for _ in 0..<cards {
            stud.append(self.removeOne() as! Trump)
        }
        
        return stud
    }
}
