//
//  PlayersInfo.swift
//  CardGame
//
//  Created by CHOMINJI on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol PlayersPrintable {
    func playersInfo() -> [Playerable]
}

struct PlayersInfo: PlayersPrintable {
    private var players: [Playerable]
    
    func playersInfo() -> [Playerable] {
        return players
    }
    
    init(players: [Playerable]) {
        self.players = players
    }
}
