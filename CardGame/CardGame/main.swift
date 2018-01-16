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
        print(InputView.Message.ofWelcoming)
        guard let input = InputView.input() else { continue }
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
        case .end : isRunning = false
            OutputView.printOfEndOfProgramMessage()
        }
    }
}

runProgram()
