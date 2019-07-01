//
//  Player.swift
//  CardGame
//
//  Created by CHOMINJI on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Playerable {
    func take(card: Card)
    func playerName() -> String
    func playerCards() -> [Card]
}

class Player {
    private var name: String = "참가자"
    private var order: Int
    private var cards: [Card]
    
    init(order: Int = 0, cards: [Card] = []) {
        self.order = order
        self.cards = cards
    }
    
    func playerOrder() -> Int {
        return order
    }
}

extension Player: Playerable {
    func take(card: Card) {
        cards.append(card)
    }
    
    func playerName() -> String {
        return name
    }
    
    func playerCards() -> [Card] {
        return cards
    }
}
