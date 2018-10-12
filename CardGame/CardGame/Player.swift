//
//  Player.swift
//  CardGame
//
//  Created by 이동건 on 11/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum PlayerType: CustomStringConvertible {
    var description: String {
        switch self {
        case .player(let index):
            return "참가자#\(index + 1)"
        case .dealer:
            return "딜러"
        }
    }
    
    case player(Int)
    case dealer
}

class Player: CardStack {
    private var type: PlayerType
    override var description: String {
        return "\(type) \(super.description)"
    }
    
    init(_ type: PlayerType, with cards: [Card]) {
        self.type = type
        super.init(cards: cards)
    }
}
