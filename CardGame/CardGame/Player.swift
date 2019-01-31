//
//  Player.swift
//  CardGame
//
//  Created by Elena on 30/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Player: GamePlayer {
    private var cards: CardDataCollection
    
    init() {
        self.cards = CardDataCollection(cards: [])
    }
    
    func takeCards(card: Card) {
        cards.add(card)
    }
    
    func showCards() -> String {
        return "\(cards)"
    }
    
    func resetCards() {
        cards.reset()
    }
    
}


