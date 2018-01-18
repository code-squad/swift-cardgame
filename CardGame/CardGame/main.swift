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
    cardDeck.shuffle()
    var isRunning = true
    while isRunning {
        let menuNum = InputView.inputMenu()
        switch menuNum {
        case .FiveCardGame, .SevenCardGame :
            let numberOfParticipants = InputView.inputPlayer()
            if numberOfParticipants == CardGameInfo.NumberOfParticipantsCases.InValidNumber {
                print(InputView.Message.ofExceedPossibleNumberOfParticipants)
                continue
            }
            let gameInfo = CardGameInfo(menuNum: menuNum.rawValue, numberOfPlayers: numberOfParticipants.rawValue)
            let cardTable = cardDeck.makeCardTable(gameInfo.numberOfPlayers, gameInfo.numberOfCards)
            OutputView.printPlayerCardTable(cardTable)
            if cardDeck.isGameRunnable() != true {
                isRunning = false
                print(OutputView.Message.ofInsufficientCard)
            }
        case .ExitGame :
            isRunning = false
        case .PleaseInputAgain:
            print(InputView.Message.ofUnsupportedInput)
            continue
            
        }
    }
}
runProgram()
