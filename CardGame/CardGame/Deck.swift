//
//  Deck.swift
//  CardGame
//
//  Created by 조재흥 on 18. 12. 4..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct Deck : CardGameDeck {
    private var cards : [Card]
    
    init() {
        var cards = [Card]()
        let suits : [Suit] = [.clubs,.hearts,.spades,.diamonds]
        let ranks : [Rank] = [.A,.two,.three,.four,.five,.six,.seven,.eight,.nine,.ten,.J,.Q,.K]
        
        for suit in suits {
            for rank in ranks {
                cards.append(Card.init(suit: suit, rank: rank))
            }
        }
        
        self.cards = cards
    }
    
    func count() -> Int {
        return cards.count
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
}
