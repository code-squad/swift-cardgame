//
//  CardDeck.swift
//  CardGame
//
//  Created by 이동건 on 23/08/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct CardDeck {
    private var cards: [Card]
    
    var count: Int {
        return cards.count
    }
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    func shuffle() {
        
    }
    
    func removeOne() {
        
    }
    
    func reset() {
        
    }
}
