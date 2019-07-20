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
    private var personnel: Personnel = .one
    private var mode: GameMode = .fiveCardStud
    private var playerGroup: PlayerGroup!
    
    mutating func run(personnel: Personnel, mode: GameMode) {
        self.personnel = personnel
        self.mode = mode
        generatePlayers()
        dealCards()
    }
    
    private mutating func generatePlayers() {
        let dealer = PokerDealer(deck: cardDeck)
        let players = (1...personnel.rawValue).map { PokerPlayer(number: $0) }
        playerGroup = PlayerGroup(dealer: dealer, players: players + [dealer])
    }
    
    private mutating func dealCards() {
        for _ in 0..<mode.rawValue {
            playerGroup.distributeCards()
        }
    }
    
    mutating func isPlayble() -> Bool {
        return personnel.rawValue * mode.rawValue <= cardDeck.count()
    }
}

extension PokerGame: OutputViewPrintable {
    func printPlayerInfo(handler: (String, String) -> ()) {
        for player in playerGroup.players() {
            handler(String(describing: player), player.cards())
        }
    }
}
