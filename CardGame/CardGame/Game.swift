//
//  Game.swift
//  CardGame
//
//  Created by oingbong on 2018. 8. 27..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Game {
    var gameType : GameType
    var player : NumberOfPlayers
    
    func shareCard() throws {
        // Players
        for i in 0..<self.player.number {
            guard let cards = CardDeck.remove(self.gameType.number) else { throw CardError.noCardsRemaining }
            let player = Player.init(cards: cards)
            let cardsWithPerson = CardsWithPerson.init(players: "참가자#\(i + 1)", cards: player.cards)
            OutputView.printCards(elements: cardsWithPerson)
        }
        
        // Dealer
        guard let cards = CardDeck.remove(self.gameType.number) else { throw CardError.noCardsRemaining }
        let cardsWithPerson = CardsWithPerson.init(players: "딜러", cards: cards)
        OutputView.printCards(elements: cardsWithPerson)
        
    }
}
