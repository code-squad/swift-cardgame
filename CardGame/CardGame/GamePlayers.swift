//
//  GamePlayers.swift
//  CardGame
//
//  Created by moon on 2018. 5. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class GamePlayers {
    private var players: [GamePlayer] = [GamePlayer]()
    
    init(numberOfPlayers: Int) {
         for _ in 0..<numberOfPlayers {
            self.players.append(GamePlayer())
        }
    }
    
    func add(cardDeck: CardDeck, numberOfCards: Int) {
        for player in self.players {
            player.add(cards: cardDeck.remove(numberOfCards: numberOfCards))
        }
    }
    
    func reset() {
        for player in players {
            player.resetCards()
        }
    }
    
    func printPlayersCards(_ numberOfPlayers: Int, by handler: (Int, GamePlayer) -> Void) {
        for playerIndex in 0..<numberOfPlayers {
            handler(playerIndex + 1, self.players[playerIndex])
        }
    }
}
