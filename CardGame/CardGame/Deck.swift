//
//  Deck.swift
//  CardGame
//
//  Created by 조재흥 on 18. 12. 4..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct Deck {
    private var cards : [Card]
    
    init() {
        var cards = [Card]()
        
        
        
        self.cards = cards
    }
    
    func count() -> Int {
        return cards.count
    }
}
