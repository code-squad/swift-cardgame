//
//  PlayerInfo.swift
//  CardGame
//
//  Created by BLU on 16/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct PlayerInfo {
    private var pokerPlayers = [Player]()
    
    mutating func addPlayer(_ player: Player) {
        pokerPlayers.append(player)
    }
    
    func players() -> [Player] {
        return pokerPlayers
    }
}
