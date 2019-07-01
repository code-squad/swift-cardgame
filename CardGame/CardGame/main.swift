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
        guard let menu = GameInputView.readMenuSelection() else {
            break gameLoop
        }
        GameInputView.askForNumberOfParticipants()
        guard let numberOfPaticipants = GameInputView.readNumberOfParticipants() else {
            break gameLoop
        }
        guard GameValidator.canPlayMore(numberOfCards: menu.numberOfCards, numberOfParticipants: numberOfPaticipants, remainingCardsCount: cardDeck.count()) else {
            break gameLoop
        }
        let players: [Player] = PlayerFactory.makeAllPlayers(including: numberOfPaticipants)
        for player in players {
            let removedCards = cardDeck.remove(numberOfCards: menu.numberOfCards)
            player.take(newCards: removedCards)
        }
        OutputView.printDealtCards(of: players)
    }
}

main()
