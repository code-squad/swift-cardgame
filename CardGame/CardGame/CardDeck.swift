//
//  CardDeck.swift
//  CardGame
//
//  Created by sungchan.you on 2019/09/27.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardDeck {

    private(set) var cards: [Card]
    
    init() {
        cards = CardHolder.allCards()
    }

    func count() -> Int {
        return cards.count
    }
    
    mutating func shuffle() -> Void {
        cards.shuffle()
    }
    
    mutating func removeOne() -> Card {
        return cards.remove(at: Int.random(in: 0..<cards.count))
    }
    
    mutating func reset() -> Void {
        cards = CardHolder.allCards()
    }
}
