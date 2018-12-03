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
        
        while true {
            let trump = Trump()
            if !isDuplicate(trump, in: self.trumps) {
                self.trumps.append(trump)
            }
            
            if self.trumps.count == 52 { break }
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
        self.trumps.shuffle()
    }
    
    mutating func removeOne() -> CardFormat {
        return self.trumps.removeFirst()
    }
    
    func count() -> Int {
        return self.trumps.count
    }
}
