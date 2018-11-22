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
    private var gamePlayers: [GamePlayer] = []
    private var players: [Player] = []

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
        gamePlayers = players
        gamePlayers.append(dealer)
    }

    private func reset() {
        for player in gamePlayers {
            player.resetCards()
        }
    }

    private func showResult(of result: (String, String) -> Void, screen clear: () -> ()) {
        clear()
        for index in players.indices {
            let name = "\(players[index].name)#\(index+1)"
            let cards = players[index].showCards()
            result(name, cards)
        }
        result(dealer.name, dealer.showCards())
        sleep(1)
    }

    private func deal(visually cards: (String, String) -> Void, screen clear: () -> ()) -> Bool {
        for _ in 1...gameMode.numberOfCards {
            for player in gamePlayers {
                guard let card = dealer.dealOut() else { return false }
                player.take(card: card)
                showResult(of: cards, screen: clear)
            }
        }
        return true
    }

    private func pickWinnerAmongPlayers() -> (winner: Player, number: Int)? {
        guard var winner = players.first else { return nil }
        var number = 0
        for index in players.indices {
            guard let bestHandOfWinner = winner.bestHand else { continue }
            guard let bestHandOfPlayer = players[index].bestHand else { continue }
            if bestHandOfWinner < bestHandOfPlayer {
                winner = players[index]
                number = index
            }
        }
        return (winner, number)
    }

    private func dealerWin(over player: Player) -> Bool? {
        guard let bestHandOfDealer = dealer.bestHand else { return nil }
        guard let bestHandOfPlayer = player.bestHand else { return nil }
        return bestHandOfPlayer < bestHandOfDealer
    }

    private func showName(of winner: (String) -> Void) {
        if let result = pickWinnerAmongPlayers() {
            guard let dealerWins = dealerWin(over: result.winner) else { return }
            if dealerWins {
                winner(dealer.name)
            } else {
                winner("\(result.winner.name)\(result.number+1)")
            }
            sleep(2)
        }
    }

    func play(visually cards: (String, String) -> Void, screen clear: () -> (), ended winner: (String) -> Void) -> Bool {
        reset()
        guard dealer.hasEnoughCards(for: gamePlayers.count, in: gameMode) else { return false }
        guard deal(visually: cards, screen: clear) else { return false }
        showName(of: winner)
        return true
    }

}
