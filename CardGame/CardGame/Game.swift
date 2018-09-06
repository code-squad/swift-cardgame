//
//  Game.swift
//  CardGame
//
//  Created by oingbong on 2018. 8. 27..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol GamePrintable : CustomStringConvertible {
    var description: String { get }
}

class Game : GamePrintable {
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
        guard let players = self.players else { return "" }
        var result = ""
        for player in players.printCardsOfPlayers() {
            result += "\(player.description)\n"
        }
        return result
    }
    
    func printGameWinner(){
        
    }
}
