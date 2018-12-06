//
//  Player.swift
//  CardGame
//
//  Created by 김장수 on 06/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum PlayerType: CustomStringConvertible {
    case player(Int)
    case dealer
    
    var description: String {
        switch self {
        case .player(let i):
            return "참가자#\(i + 1)"
        case .dealer:
            return "딜러"
        }
    }
}

class Player: CardStack {
    private var type: PlayerType
    
    init(name: PlayerType) {
        self.type = name
        super.init(stud: [Trump]())
    }
    
    override var description: String {
        return "\(self.type) \(super.description)"
    }
    
    func get(_ stud: [Trump]) {
        super.take(stud)
    }
}
