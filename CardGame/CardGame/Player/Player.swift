//
//  Player.swift
//  CardGame
//
//  Created by Daheen Lee on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Player {
    var role: String {
        return "플레이어"
    }
    
    var cards: Cards
    
    init() {
        self.cards = Cards()
    }
    
    func take(newCards: Cards) {
        self.cards.add(newCards: newCards)
    }
}

extension Player: Equatable, Comparable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.cards == rhs.cards
    }
    
    static func < (lhs: Player, rhs: Player) -> Bool {
        return lhs.cards < rhs.cards
    }
}
