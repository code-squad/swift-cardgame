//
//  Deck.swift
//  CardGame
//
//  Created by 김장수 on 03/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct CardDeck: DeckFormat {
    private var trumps = [Trump]()
    
    mutating func reset() {
        self.trumps = [Trump]()
        
        for _ in 0...51 {
            var trump = Trump()
            
            while isDuplicate(trump, in: self.trumps) {
                trump = Trump()
            }
            self.trumps.append(trump)
        }
    }
    
    private func isDuplicate(_ trump: Trump, in trumps: [Trump]) -> Bool {
        for card in trumps {
            if trump.description() == card.description() {
                return true
            }
        }
        
        return false
    }
    
    mutating func shuffle() {
        for i in 0..<self.trumps.count {
            let j = Int(arc4random_uniform(UInt32(self.trumps.count - i))) + i
            self.trumps.swapAt(i, j)
        }
        
        self.trumps = self.trumps.shuffled()
    }
    
    mutating func removeOne() -> CardFormat {
        return self.trumps.removeFirst()
    }
    
    func count() -> Int {
        return self.trumps.count
    }
}
