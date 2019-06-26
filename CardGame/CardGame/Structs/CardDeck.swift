//
//  CardDeck.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardDeck: Deck {
    typealias T = Card
    var elements: [Card]
    
    init() {
        self.elements = [Card]()
        self.elements.append(Card(suit: .clubs, rank: .ace))
    }
    
    func count() -> Int {
        return 0
    }
    
    mutating func removeOne() -> Card? {
        return elements[0]
    }
    
    mutating func shuffle() {
        ()
    }
    
    mutating func reset() {
        ()
    }
    
}

extension CardDeck: Equatable {
    static func == (lhs: CardDeck, rhs: CardDeck) -> Bool {
        return lhs.count() == rhs.count()
    }
}
