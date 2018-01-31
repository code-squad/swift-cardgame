//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func runProgram () {
    var isRunnning = true
    while isRunnning {
        let menuNum = InputView.inputMenu()
        switch menuNum {
        case .FiveCardGame, .SevenCardGame :
            let numberOfParticipants = InputView.inputPlayer()
            if numberOfParticipants == CardGameInfo.NumberOfParticipants.InValidNumber {
                print(InputView.Message.ofExceedPossibleNumberOfParticipants)
                continue
            }
            let gameInfo = CardGameInfo(menuNum: menuNum, numberOfPlayers: numberOfParticipants)
            let resultGame = PlayingGame(gameInfo.numberOfPlayers, gameInfo.numberOfCards)
            OutputView.printPlayerCardTable(resultGame.players)
            OutputView.printWinner(resultGame.decideWinner())
            print("\(resultGame.remainCard)장의 카드가 남아있습니다.")
            if PlayingGame.isGameRunnable(gameInfo, resultGame.remainCard) != true {
                print(OutputView.Message.ofInsufficientCardAndResetMessage)
                break
            }
        case .ExitGame :
            OutputView.printOfEndOfProgramMessage()
            isRunnning = false
        case .PleaseInputAgain:
            print(InputView.Message.ofUnsupportedInput)
            continue
        }
    }
}
runProgram()
