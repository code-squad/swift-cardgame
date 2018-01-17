//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

var runProgram : Bool = true
var cardDeck = CardDeck()
let outputView = OutputView()

func makeStack(stud: Int) -> CardStack {
    let cards = cardDeck.makeCards(stud)
    let stack = cardDeck.makeStack(cards: cards)
    return stack
}

func runStud() {
    while runProgram {
        let gameInput = GameInputView()
        let userInput = gameInput.askGameType(message: OutputView.ProgramDescription.chooseCardStud.description)
        let inputMenu = gameInput.select(menu: userInput)

        let inputNumber = gameInput.askNumberOfPlayer(message: OutputView.ProgramDescription.askNumberOfPlayer.description)
        if let numberOfPlayer = inputNumber {
            if numberOfPlayer >= 0 &&  numberOfPlayer <= 4 {
                switch inputMenu {
                case .one:
                    let studType = 7
                    if (numberOfPlayer * studType) > cardDeck.count() {
                        runProgram = false
                        outputView.showResult(text: OutputView.ProgramDescription.lackOfCard.description)
                        break
                    }
                    for playerNumber in 0..<numberOfPlayer {
                        let stack = makeStack(stud: studType)
                        let player = Player(stack: stack, position: playerNumber+1)
                        outputView.showResult(text: player.description)
                    }
                    let dealerStack = makeStack(stud: studType)
                    let dealer = Dealer(stack: dealerStack)
                    outputView.showResult(text: dealer.description)
                    outputView.showResult(text: cardDeck.description)
                case .two:
                    let studType = 5
                    if (numberOfPlayer * studType) > cardDeck.count() {
                        runProgram = false
                        outputView.showResult(text: OutputView.ProgramDescription.lackOfCard.description)
                        break
                    }
                    for playerNumber in 0..<numberOfPlayer {
                        let stack = makeStack(stud: studType)
                        let player = Player(stack: stack, position: playerNumber+1)
                        outputView.showResult(text: player.description)
                    }
                    let dealerStack = makeStack(stud: studType)
                    let dealer = Dealer(stack: dealerStack)
                    outputView.showResult(text: dealer.description)
                    outputView.showResult(text: cardDeck.description)
                case .quitGame:
                    runProgram = false
                    outputView.showResult(text: OutputView.ProgramDescription.quitGame.description)
                case .wrongInput:
                    outputView.showResult(text: OutputView.ProgramDescription.wrongInput.description)
                }
            } else {
                outputView.showResult(text: OutputView.ProgramDescription.wrongInput.description)
                continue
            }
        } else {
            outputView.showResult(text: OutputView.ProgramDescription.wrongInput.description)
            continue
        }
    }
}

runStud()

