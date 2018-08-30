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
    private var players : Players?

    init?(_ type : GameType , _ numberOfPlayers : NumberOfPlayers , _ cardDeck : CardDeck) {
        self.gameType = type
        self.numberOfPlayers = numberOfPlayers
        guard let players = Players.init(self.numberOfPlayers, self.gameType, cardDeck) else { return nil }
        self.players = players
    }

    var description: String {
        return self.players?.description ?? ""
    }
}
