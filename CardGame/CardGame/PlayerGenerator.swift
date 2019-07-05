//
//  PlayerGenerator.swift
//  CardGame
//
//  Created by BLU on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct PlayerGenerator {
    
    static func generatePlayers(by numberOfPlayers: Int) -> [Player] {
        let players = (1...numberOfPlayers).map { PokerPlayer(hand: Hand(), number: $0) }
        return players
    }
}
