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
    func showCards() -> String
}

class Player {
    private var order: Int
    private var cards: [Card]
    
    init(order: Int = 0, cards: [Card] = []) {
        self.order = order
        self.cards = cards
    }
}

extension Player: Playerable {
    func take(card: Card) {
        cards.append(card)
    }
    
    func showCards() -> String {
        return "\(cards)"
    }
    
    func showOrder() -> String {
        return "\(order)"
    }
}
