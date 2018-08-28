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
    
    func playerCards() -> [CardsWithPlayer]? {
        var cardsWithPersons = [CardsWithPlayer]()
        for i in 0..<self.players.number {
            guard let cards = CardDeck.remove(self.gameType.number) else { return nil }
            let cardsWithPerson = CardsWithPlayer.init("참가자#\(i + 1)", cards)
            cardsWithPersons.append(cardsWithPerson)
        }
        return cardsWithPersons
    }
    
    func dealerCards() -> CardsWithPlayer? {
        guard let cards = CardDeck.remove(self.gameType.number) else { return nil }
        let cardsWithPerson = CardsWithPlayer.init("딜러", cards)
        return cardsWithPerson
    }
}
