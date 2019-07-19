//
//  PokerGame.swift
//  CardGame
//
//  Created by BLU on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct PokerGame {
    private var cardDeck = CardDeck()
    private var numberOfPlayers: Personnel = .one
    private var mode: GameMode = .fiveCardStud
    private var pokerPresenter: PokerPresenter!
    
    mutating func run(numberOfPlayers: Personnel, mode: GameMode) {
        self.numberOfPlayers = numberOfPlayers
        self.mode = mode
        generatePlayers()
        deal()
    }
    
    private mutating func generatePlayers() {
        let dealer = PokerDealer(deck: cardDeck)
        let players = (1...numberOfPlayers.rawValue).map { PokerPlayer(number: $0) }
        pokerPresenter = PokerPresenter(dealer: dealer, players: players + [dealer])
    }
    
    private mutating func deal() {
        for _ in 0..<mode.rawValue {
            pokerPresenter.distributeCards()
        }
    }
    
    mutating func isPlayble() -> Bool {
        return numberOfPlayers.rawValue * mode.rawValue <= cardDeck.count()
    }
}

extension PokerGame: OutputViewPrintable {
    func printPlayerInfo(handler: (String, String) -> ()) {
        for player in pokerPresenter.players() {
            handler(String(describing: player), player.cards())
        }
    }
}
