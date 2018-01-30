//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

// 기존 메인코드는 tempBranchForCradGame 브랜치에 푸시해놓았습니다.

func runProgram () {
    var cardDeck = CardDeck()
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
            let resultGame = PlayingGame.runGame(gameInfo.numberOfPlayers, gameInfo.numberOfCards)
            OutputView.printPlayerCardTable(resultGame.players)
            OutputView.printWinner(resultGame.players)
            print("\(resultGame.remainCard)장의 카드가 남아있습니다.")
            if PlayingGame.isGameRunnable(gameInfo, resultGame.remainCard) != true {
                print(OutputView.Message.ofInsufficientCard)
                break
            }
        case .ChargeCard :
            cardDeck = CardDeck()
            cardDeck.shuffle()
            print(OutputView.Message.ofSucceedChargingCard)
        case .ExitGame :
            print (OutputView.Message.ofEndOfProgram)
            isRunnning = false
        case .PleaseInputAgain:
            print(InputView.Message.ofUnsupportedInput)
            continue
            
        }
    }
}
runProgram()
