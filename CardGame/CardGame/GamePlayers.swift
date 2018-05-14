//
//  GamePlayers.swift
//  CardGame
//
//  Created by moon on 2018. 5. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct GamePlayers {
    private var players: [GamePlayer]
    
    init(numberOfPlayers: Int) {
        self.players = [GamePlayer](repeating: GamePlayer(), count: numberOfPlayers)
    }
    
    mutating func add(cards: [Card], to playerNumber: Int) {
        self.players[playerNumber].add(cards: cards)
    }
    
    func descriptionOfPlayer(_ playerNumber: Int) -> String {
        return "참가자#\(playerNumber + 1) \(self.players[playerNumber].description)"
    }
}
