//
//  Player.swift
//  CardGame
//
//  Created by oingbong on 2018. 8. 29..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Players {
    private var players : [Player]
    
    init?(_ numberOfPlayers: NumberOfPlayers , _ gameType: GameType , _ cardDeck: CardDeck) {
        var players = [Player]()
        for i in 0..<numberOfPlayers.rawValue {
            guard let cards = cardDeck.remove(gameType.number) else { return nil }
            players.append(Player.init(cards , "참가자#\(i + 1)"))
        }
        guard let cards = cardDeck.remove(gameType.number) else { return nil }
        players.append(Player.init(cards , "딜러"))
        
        self.players = players
    }
    
    func printPlayersCards(_ handler: (Player) -> Void) {
        for index in 0..<self.players.count {
            handler(self.players[index])
        }
    }
}

class Player : CustomStringConvertible {
    private var cards : [Card] = []
    private var name : String
    
    init(_ cards: [Card] , _ name: String) {
        self.cards = cards
        self.name = name
    }
    
    var description: String {
        return "\(self.name) \(self.cards)"
    }
}
