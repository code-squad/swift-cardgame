//
//  Deck.swift
//  CardGame
//
//  Created by 김장수 on 03/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

protocol CardCountable {
    func count() -> Int
}

protocol DeckFormat: CardCountable, CardScatterable {
    mutating func reset()
    mutating func shuffle()
    mutating func removeOne() -> CustomStringConvertible
}

protocol CardScatterable {
    mutating func drawCardStud(of cards: Int) -> [Trump]
}

struct CardDeck: DeckFormat {
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
        
        self.trumps = self.trumps.shuffled()
    }
    
    mutating func removeOne() -> CustomStringConvertible {
        return self.trumps.removeFirst()
    }
    
    func count() -> Int {
        return self.trumps.count
    }
    
    mutating func drawCardStud(of cards: Int) -> [Trump] {
        var stud = [Trump]()
        
        for _ in 0...cards {
            guard let card = self.removeOne() as? Trump else {
                print("예상하지 못한 오류가 발생했습니다")
                return stud
            }
            stud.append(card)
        }
        
        return stud
    }
}
