//
//  CardGame.swift
//  CardGame
//
//  Created by JH on 17/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGame {
    
    enum GameType: Int {
        case sevenCard = 7
        case fiveCard = 5
    }
    
    var gameType: GameType = .fiveCard
    
    mutating func setGameType(_ type: GameType) {
        self.gameType = type
    }
    
    
}
