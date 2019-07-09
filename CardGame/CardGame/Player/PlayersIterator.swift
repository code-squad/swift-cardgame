//
//  PlayersIterator.swift
//  CardGame
//
//  Created by Daheen Lee on 09/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

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
