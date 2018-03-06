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
            print(PreGameMessage.ofUnsupportedInput)
            continue
        }
        guard let numberOfParticipants = InputView.numberOfParticipants() else {
            print(PreGameMessage.ofExceedPossibleNumberOfParticipants)
            continue    
        }
        guard PlayingGame.isRunnable(numberOfParticipants, kindOfGame, dealer) else {
            print(InGameMessage.ofInsufficientCard)
            break
        }
        let resultGame = PlayingGame(numberOfParticipants, kindOfGame, dealer)
        OutputView.printCardsOfPlayers(resultGame)
        OutputView.printContents(message: resultGame.decideWinner().getWinnerInfo())
        OutputView.printContents(message: dealer.noticeRemainCard())
    }
}

runProgram()
