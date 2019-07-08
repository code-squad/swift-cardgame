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

extension Players: Sequence {
    func makeIterator() -> PlayersIterator {
        return PlayersIterator(playerList)
    }
}

struct PlayersIterator: IteratorProtocol {
    var currentIndex = 0
    var players: [Player]
    
    init(_ players: [Player]) {
        self.players = players
    }
    
    mutating func next() -> Player? {
        if currentIndex >= players.count {
            return nil
        }
        defer {
            currentIndex += 1
        }
        return players[currentIndex]
    }
}

extension Players: CustomStringConvertible {
    var description: String {
        var result = String()
        for playerNumberPair in playerNumberPairs {
            result += "\(playerNumberPair.player.role)"
            if let number = playerNumberPair.number {
                result += "#\(number)"
            }
            result += "\(playerNumberPair.player.cards)\n"
        }
        return result
    }
}

