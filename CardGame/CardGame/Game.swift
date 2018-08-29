//
//  Game.swift
//  CardGame
//
//  Created by oingbong on 2018. 8. 27..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Game : CustomStringConvertible {
    private var gameType : GameType
    private var numberOfPlayers : NumberOfPlayers
    private var players : Players

    init(_ type : GameType , _ numberOfPlayers : NumberOfPlayers) {
        self.gameType = type
        self.numberOfPlayers = numberOfPlayers
        self.players = Players()
    }

    func shareCards(_ cardDeck:CardDeck) -> Bool {
        // players
        return players.add(self.numberOfPlayers, self.gameType, cardDeck)
    }

    var description: String {
        return self.players.description
    }
}
