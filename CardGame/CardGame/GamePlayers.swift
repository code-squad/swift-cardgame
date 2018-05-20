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
    
    func selectWinner() -> (Int, PokerHands.Hand) {
        var winnerHand = players.first!.bestHand
        var winnerPlayerNumber: Int = 1
        for (playerNumber, player) in players.enumerated() {
            print("\(playerNumber + 1) 는 \(player.bestHand)")
            if winnerHand < player.bestHand {
                winnerHand = player.bestHand
                winnerPlayerNumber = playerNumber + 1
            } else if winnerHand == player.bestHand {
                if player.bestHand.cardNumber.rawValue > winnerHand.cardNumber.rawValue {
                    winnerHand = player.bestHand
                    winnerPlayerNumber = playerNumber + 1
                }
            }
        }
        return (winnerPlayerNumber, winnerHand)
    }
}
