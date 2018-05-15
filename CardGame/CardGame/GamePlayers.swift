//
//  GamePlayers.swift
//  CardGame
//
//  Created by moon on 2018. 5. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class GamePlayers {
    private var players: [GamePlayer]
    
    init(numberOfPlayers: Int) {
        self.players = [GamePlayer](repeating: GamePlayer(), count: numberOfPlayers)
    }
    
    func add(cardDeck: CardDeckConvertible, numberOfCards: Int) -> Bool {
        var result: Bool = true
        for player in players {
            if cardDeck.hasEnoughCards(numberOfCards: numberOfCards) {
                result = false
                break
            }
            let removedCards = cardDeck.remove(numberOfCards: numberOfCards)
            player.add(cards: removedCards)
        }
        return result
    }
    
    func reset() {
        for player in players {
            player.resetCards()
        }
    }
    
    func descriptionOfPlayer(_ playerNumber: Int) -> String {
        return "참가자#\(playerNumber + 1) \(self.players[playerNumber].description)"
    }
}
