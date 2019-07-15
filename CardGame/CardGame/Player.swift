//
//  Player.swift
//  CardGame
//
//  Created by 이진영 on 15/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Player: Playable {
    private var cards: [Card] = []
    private var name = "참가자#"
    
    init(number: Int) {
        self.name.append("\(number)")
    }
    
    func receive(card: Card) {
        cards.append(card)
    }
}
