//
//  CardGame.swift
//  CardGame
//
//  Created by CHOMINJI on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGame {
    let info: GameInfoable
    var players: [Playerable] = []
    let dealer: Dealerable & Playerable = Dealer(deck: CardDeck())
    
    init(info: GameInfoable) {
        self.info = info
    }
    
    private mutating func setPlayer() {
        let numOfPlayers = info.playerCount()
        for order in 1...numOfPlayers {
            players.append(Player(order: order))
        }
        players.append(dealer)
    }
    
    private func setHand() {
        let numOfCards = info.gameMode().numOfCards
        
        for _ in 1...numOfCards {
            for player in players {
                guard let card = dealer.deal() else { return }
                player.take(card: card)
            }
        }
    }
    
    mutating func run() {
        setPlayer()
        setHand()
        let playerInfo = PlayersInfo(players: players)
        OutputView.printCards(of: playerInfo)
    }
}
