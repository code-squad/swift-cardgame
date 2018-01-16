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

// MARK: runInput

func runInput() {
    while runProgram{
        let inputView = InputView()
        let userInput = inputView.askUserInput(text: OutputView.ProgramDescription.chooseMenu.description)
        let inputMenu = inputView.select(rawValue: userInput)

        switch inputMenu {

        case .one:
            cardDeck = cardDeck.reset()
            outputView.showResult(text: cardDeck.description)
        case .two:
            cardDeck.shuffle()
            outputView.showResult(text: cardDeck.makeShuffleMessage())
        case .three:
            let pickedCard = cardDeck.removeOne()
            outputView.showResult(text: pickedCard.description)
            outputView.showResult(text: cardDeck.description)
        case .quitGame:
            runProgram = false
            outputView.showResult(text: OutputView.ProgramDescription.quitGame.description)
            break
        case .wrongInput:
            outputView.showResult(text: OutputView.ProgramDescription.wrongInput.description)
        }
    }
}


/*
 InputView를 거치지 않고 스택만 표시하기위해서는 아예 로직이 달라지기 때문에
 InputView를 제거하는 대신 다른 함수로 묶어서 스택 출력만 하는 함수를 호출했습니다.
*/

// MARK: runStud only


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

