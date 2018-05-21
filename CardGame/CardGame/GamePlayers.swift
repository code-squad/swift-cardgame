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
    
    func printPlayersCards(_ handler: (GamePlayer) -> Void) {
        for index in self.players.indices {
            print("참가자#\(index + 1)", terminator: "")
            handler(self.players[index])
        }
    }
    
    func sortCard() {
        for player in self.players {
            player.sortCard()
        }
    }
    
    func selectWinner() -> (Int, GamePlayer) {
        var winner = players.first!
        for player in players {
            winner = winner.selectWinner(player)
        }
        return (numberOf(winner: winner) + 1, winner)
    }
    
    private func numberOf(winner: GamePlayer) -> Int {
        var winnerIndex: Int = 0
        for index in self.players.indices {
            if winner == players[index] {
                winnerIndex = index
            }
        }
        return winnerIndex
    }
}
