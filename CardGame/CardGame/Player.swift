//
//  Player.swift
//  CardGame
//
//  Created by 이동건 on 11/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum PlayerType {
    case player
    case dealer
}

class Player: CardStack {
    private (set) var type: PlayerType
    
    init(_ type: PlayerType, with cards: [Card]) {
        self.type = type
        super.init(cards: cards)
    }
}
