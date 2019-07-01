//
//  Player.swift
//  CardGame
//
//  Created by Daheen Lee on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Player: CustomStringConvertible {
    private var cards: [Card]
    
    init() {
        self.cards = [Card]()
    }
    
    func take(newCards: [Card]) {
        self.cards.append(contentsOf: newCards)
    }
    
    var description: String {
        return "\(self.cards)"
    }
}

