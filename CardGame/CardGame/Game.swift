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
    
    func shareCard() {
        CardDeck.reset()
        CardDeck.shuffle()
        
        // Players
        for i in 0..<self.player.number {
            if let cards = CardDeck.remove(self.gameType.number) {
                let player = Player.init(cards: cards)
                let cardsWithPerson = CardsWithPerson.init(players: "참가자#\(i + 1)", cards: player.cards)
                OutputView.printCards(elements: cardsWithPerson)
            }
        }
        
        // Dealer
        if let cards = CardDeck.remove(self.gameType.number) {
            let cardsWithPerson = CardsWithPerson.init(players: "딜러", cards: cards)
            OutputView.printCards(elements: cardsWithPerson)
            
        }
        
    }
}
