//
//  Players.swift
//  CardGame
//
//  Created by Daheen Lee on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

typealias PlayerNumberPair = (player: Player, number: Int?)

class Players {
    var playerNumberPairs: [PlayerNumberPair]
    var playerList: [Player] {
        return playerNumberPairs.map { $0.player }
    }
    
    init(dealer: Dealer, participants: [Participant]) {
        self.playerNumberPairs = [PlayerNumberPair]()
        self.playerNumberPairs.append((dealer as Player, nil))
        for (index, participant) in participants.enumerated() {
            self.playerNumberPairs.append((participant as Player, index + 1))
        }
    }
    
    func determineWinner() -> String {
        var winner = playerNumberPairs[0].player
        var winnerNumber = playerNumberPairs[0].number
        for comparingIndex in 1..<playerNumberPairs.count {
            let (comparingPlayer, comparingPlayerNumber) = playerNumberPairs[comparingIndex]
            if winner < comparingPlayer {
                winner = comparingPlayer
                winnerNumber = comparingPlayerNumber
            }
        }
        guard let number = winnerNumber else {
            return "\(winner.role)"
        }
        return "\(winner.role)#\(number)"
    }
}
