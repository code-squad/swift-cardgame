//
//  CardGame.swift
//  CardGame
//
//  Created by CHOMINJI on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol OutputViewPrintable {
    func printSettingResult(_ result: (Bool, String, String) -> Void)
}

struct CardGame: OutputViewPrintable {
    private let info: GameInfoable
    private var players: [Playerable]
    private let dealer: Dealerable & Playerable
    
    init(info: GameInfoable, dealer: Dealerable & Playerable, players: [Playerable] = []) {
        self.info = info
        self.players = players
        self.dealer = dealer
    }
    
    private func canContinueGame() -> Bool {
        let numOfCards = info.gameMode().numOfCards
        let requirement = numOfCards * info.participants().count
        return dealer.hasEnounghCards(for: requirement)
    }
    
    mutating func run() {
        guard canContinueGame() else {
            return
        }
        setPlayer()
        setCards()
    }
    
    func printSettingResult(_ result: (Bool, String, String) -> Void) {
        for player in players {
            let participant = player as? Player
            let isPlayer = participant != nil
            let order = isPlayer ? participant!.showOrder() : ""
            let cards = player.showCards()
            result(isPlayer, order, cards)
        }
    }
}

// MARK: Setting Games

extension CardGame {
    private mutating func setPlayer() {
        let numOfPlayers = info.participants().count
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
