//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    var cardDeck = CardDeck()

    gameLoop: while true {
        GameInputView.askForMenuSelection()
        guard let gameMode = GameInputView.readMenuSelection() else {
            break gameLoop
        }
        GameInputView.askForNumberOfParticipants()
        guard let numberOfParticipants = GameInputView.readNumberOfParticipants() else {
            break gameLoop
        }
        guard cardDeck.hasEnoughCards(for: gameMode.numberOfCards, numberOfParticipants: numberOfParticipants.count) else {
            break gameLoop
        }
        let players: [Player] = PlayerFactory.makeAllPlayers(including: numberOfParticipants.count)
        for player in players {
            var player = player
            let removedCards = cardDeck.remove(numberOfCards: gameMode.numberOfCards)
            player.take(newCards: removedCards)
        }
        OutputView.printDealtCards(of: players)
        let winner = WinnerDeterminator.determineWinner(among: players)
        OutputView.printDealtCards(of: [winner])
    }
}

main()
