//
//  CardGame.swift
//  CardGame
//
//  Created by 윤지영 on 16/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class CardGame {
    private let gameMode: GameMode
    private let numberOfPlayers: Int
    private var dealer: Dealer
    private var players: [GamePlayer] = []

    init(gameMode: GameMode, numberOfPlayers: Int) throws {
        self.gameMode = gameMode
        guard numberOfPlayers > 0 else { throw GameError.noPlayer }
        self.numberOfPlayers = numberOfPlayers
        self.dealer = Dealer(with: CardDeck())
        setPlayers()
    }

    private func setPlayers() {
        for number in 1...numberOfPlayers {
            let player = Player(number: number)
            players.append(player)
        }
        players.append(dealer)
    }

    private func reset() {
        for player in players {
            player.resetCards()
        }
    }

    private func deal() throws {
        for _ in 1...gameMode.numberOfCards {
            for player in players {
                guard let card = dealer.dealOut() else { throw GameError.noCard }
                player.take(card: card)
            }
        }
    }

    func play() throws -> Bool {
        reset()
        try deal()
        return true
    }

    func showCards() -> String {
        let cardsOfAllPlayers = players
            .map { $0.showCards() }
            .joined(separator: "\n")
        let endOfTurn = String(repeating: "-", count: gameMode.numberOfCards * 6)
        return "\(cardsOfAllPlayers)\n\(endOfTurn)"
    }

}
