//
//  GameInfo.swift
//  CardGame
//
//  Created by CHOMINJI on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol GameInfoable {
    func gameMode() -> GameMenu
    func playerCount() -> Int
}

struct GameInfo {
    private var mode: GameMenu
    private var numOfPlayers: Int
    
    init?(mode: GameMenu, players: Int) {
        guard 1...4 ~= players else {
            return nil
        }
        self.mode = mode
        self.numOfPlayers = players
    }
}

extension GameInfo: GameInfoable {
    func gameMode() -> GameMenu {
        return mode
    }
    
    func playerCount() -> Int {
        return numOfPlayers
    }
}
