//
//  GameInfo.swift
//  CardGame
//
//  Created by CHOMINJI on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol GameInfoable {
    func gameMode() -> GameMode
    func participants() -> Participant
}

struct GameInfo {
    private var mode: GameMode
    private var numOfPlayers: Participant
    
    init(mode: GameMode, players: Participant) {
        self.mode = mode
        self.numOfPlayers = players
    }
}

extension GameInfo: GameInfoable {
    func gameMode() -> GameMode {
        return mode
    }
    
    func participants() -> Participant {
        return numOfPlayers
    }
}
