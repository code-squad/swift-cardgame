//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func runProgram () {
    let dealer = Dealer.shared
    while true {
        guard let kindOfGame = InputView.sevenOrFiveGame() else {
            print(InputView.Message.ofUnsupportedInput)
            continue
        }
        guard let numberOfParticipants = InputView.numberOfParticipants() else {
            print(InputView.Message.ofExceedPossibleNumberOfParticipants)
            continue
        }
        guard PlayingGame.isRunnable(numberOfParticipants, kindOfGame, dealer) else {
            OutputView.printOfInsufficientCard()
            break
        }
        let resultGame = PlayingGame(numberOfParticipants, kindOfGame, dealer)
        let ouputView = OutputView(resultGame)
        ouputView.printCardsOfPlayers()
        ouputView.printWinner()
        OutputView.printRemainingCards(dealer)
    }
}

runProgram()
