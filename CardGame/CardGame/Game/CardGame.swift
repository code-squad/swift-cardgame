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
        guard numberOfPlayers > 0 else { throw GameInputError.noPlayer }
        self.numberOfPlayers = numberOfPlayers
        self.dealer = Dealer(with: CardDeck())
        setPlayers()
    }

    private func setPlayers() {
        for _ in 1...numberOfPlayers {
            let player = Player()
            players.append(player)
        }
        players.append(dealer)
    }

    private func reset() {
        for player in players {
            player.resetCards()
        }
    }

    private func deal() -> Bool {
        for _ in 1...gameMode.numberOfCards {
            for player in players {
                guard let card = dealer.dealOut() else { return false }
                player.take(card: card)
            }
        }
        return true
    }

    func play() -> Bool {
        reset()
        guard deal() else { return false }
        return true
    }

    func showResult(of result: (Bool, Int, String) -> Void) {
        for index in players.indices {
            let isDealer = players[index] is Dealer
            let number = index+1
            let cards = players[index].showCards()
            result(isDealer, number, cards)
        }
    }

}
