//
//  Players.swift
//  CardGame
//
//  Created by 이동영 on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class PlayerEntry: Entry {
    typealias P = MyPlayer
    
    private var players: [MyPlayer]
    
    init(players: [P]) {
        self.players = players
    }
    
    private func playerReset() {
        self.players.forEach{ $0.clearHand() }
    }
    
    func count() -> Int {
        return self.players.count
    }
    
    private func win() -> P {
        let winner = players.reduce(players[0]) { $0 < $1 ? $1 : $0 }
        return winner
    }
}
