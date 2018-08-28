//
//  Game.swift
//  CardGame
//
//  Created by oingbong on 2018. 8. 27..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Game {
    private var gameType : GameType
    private var players : NumberOfPlayers

    init(_ type : GameType , _ numberOfPlayers : NumberOfPlayers) {
        self.gameType = type
        self.players = numberOfPlayers
    }
    
    func shareCards() -> [CardsWithPlayer]? {
        var cardsWithPersons = [CardsWithPlayer]()
        // players
        for i in 0..<self.players.number {
            guard let playerCards = CardDeck.remove(self.gameType.number) else { return nil }
            cardsWithPersons.append(CardsWithPlayer.init("참가자#\(i + 1)", playerCards))
        }
        // dealer
        guard let dealerCards = CardDeck.remove(self.gameType.number) else { return nil }
        cardsWithPersons.append(CardsWithPlayer.init("딜러", dealerCards))
        
        return cardsWithPersons
    }
}
