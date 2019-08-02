//
//  PokerPlayers.swift
//  CardGame
//
//  Created by JieunKim on 02/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class PokerPlayers {
    private var players = [PokerPlayer]()
    private var dealer: Dealer
    private let gameMode: CardGameMode
    private let numberOfplayers: Int
    
    
    init(dealer: Dealer, gameMode: CardGameMode, players: Int) {
          self.dealer = dealer
          self.gameMode = gameMode
          self.numberOfplayers = players
          reset()
          setPlayer()
          setCards()
    }
    
    func playersInfo(handler: (String, String) -> ()) {
        players.forEach { player in handler(player.name, String(describing: player.hand))}
    }
    
    func winner() -> PokerPlayer {
        let winner = players.max()!
        return winner
    }
    
    func reset() {
        self.players.forEach{$0.hand.clear()}
    }
    
    func setPlayer() {
        for order in 1...numberOfplayers {
            players.append(PokerPlayer(number: order, name:"참가자"))
        }
        players.append(dealer as! PokerPlayer)
    }
    
    func setCards() {
        let numberOfCards = gameMode.numberOfCards
        
        for _ in 1...numberOfCards {
            for player in players {
                guard let card = self.dealer.give() else {
                    return
                }
                player.receive(newCards: card)
            }
        }
    }
}
