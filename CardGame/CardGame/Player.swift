//
//  Player.swift
//  CardGame
//
//  Created by oingbong on 2018. 8. 29..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Players : CustomStringConvertible {
    private var players : [Player] = []
    
    func add(_ numberOfPlayers: NumberOfPlayers , _ gameType: GameType , _ cardDeck: CardDeck) -> Bool  {
        for i in 0..<numberOfPlayers.number {
            guard let cards = cardDeck.remove(gameType.number) else { return false }
            self.players.append(Player.init(cards , "참가자#\(i + 1)"))
        }
        guard let cards = cardDeck.remove(gameType.number) else { return false }
        self.players.append(Player.init(cards , "딜러"))
        
        return true
    }
    
    var description: String {
        var cardsWithPlayers = ""
        for player in players {
            cardsWithPlayers += "\(player.description)\n"
        }
        return cardsWithPlayers
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
