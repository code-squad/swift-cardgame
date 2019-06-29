//
//  CardHand.swift
//  CardGame
//
//  Created by 이동영 on 29/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CardHand: Hand {
    typealias Element = Card
    
    private var cards: [Card] = []
    
    func append(_ gameElement: Card) {
        cards.append(gameElement)
    }
    
    func showAll() -> [Card] {
        return self.cards
    }
    
    func clear() {
        self.cards.removeAll()
    }
    
}
