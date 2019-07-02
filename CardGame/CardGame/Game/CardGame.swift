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
    var players: [Playerable]
    let dealer: Dealerable & Playerable
    
    init(info: GameInfoable, dealer: Dealerable & Playerable, players: [Playerable] = []) {
        self.info = info
        self.players = players
        self.dealer = dealer
    }
    
    private func canContinueGame() -> Bool {
        let numOfCards = info.gameMode().numOfCards
        let requirement = numOfCards * info.playerCount()
        return dealer.hasEnounghCards(for: requirement)
    }
    
    mutating func run() {
        guard canContinueGame() else {
            return
        }
        setPlayer()
        setCards()
        OutputView.printInfo(of: players)
    }
}

// MARK: Setting Games

extension CardGame {
    private mutating func setPlayer() {
        let numOfPlayers = info.playerCount()
        for order in 1...numOfPlayers {
            players.append(Player(order: order))
        }
        players.append(dealer)
    }
    
    private func setCards() {
        let numOfCards = info.gameMode().numOfCards
        for _ in 1...numOfCards {
            for player in players {
                guard let card = dealer.deal() else { return }
                player.take(card: card)
            }
        }
    }
}
