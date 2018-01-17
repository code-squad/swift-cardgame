//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func runProgram () {
    var cardDeck = CardDeck()
    var isRunning = true
    while isRunning {
        let input = InputView.input()
        switch input {
        case .reset:
            cardDeck.resetCard()
            OutputView.printOfResetMessage()
        case .suffle:
            cardDeck.shuffle()
            OutputView.printShuffle(cardDeck)
        case .pick:
            print (cardDeck.pickCard())
            OutputView.printPickCard(cardDeck)
        case .end :
            OutputView.printOfEndOfProgramMessage()
            isRunning = false
        case .pleaseInputAgain :
            print (InputView.Message.ofUnsupportedInput)
            continue
        }
    }
}

runProgram()
