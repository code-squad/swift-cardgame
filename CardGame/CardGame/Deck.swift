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
        let suits : [Suit] = [.clubs,.hearts,.spades,.diamonds]
        let numbers : [Number] = [.A,.two,.three,.four,.five,.six,.seven,.eight,.nine,.ten,.J,.Q,.K]
        
        for suit in suits {
            for number in numbers {
                cards.append(Card.init(suit: suit, number: number))
            }
        }
        
        self.cards = cards
    }
    
    func count() -> Int {
        return cards.count
    }
}
