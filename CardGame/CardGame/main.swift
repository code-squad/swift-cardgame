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

func studType(_ gameInput: GameInputView) -> GameInputView.CardStudMenu {
    let userInputStud = gameInput.askGameType(message:
        OutputView.ProgramDescription.chooseCardStud)
    return gameInput.select(menu: userInputStud)
}

func play(stud: Int, numberOfPlayer: Int) {
    for playerNumber in 0..<numberOfPlayer {
        let stack = makeStack(stud: stud)
        let player = Player(stack: stack, position: playerNumber+1)
        outputView.showResult(text: player)
    }
    let dealerStack = makeStack(stud: stud)
    let dealer = Dealer(stack: dealerStack)
    outputView.showResult(text: dealer)
    outputView.showResult(text: cardDeck)
}


func run() {
    while runProgram {
        let gameInput = GameInputView()
        let stud = studType(gameInput)

        let inputNumber = gameInput.askNumberOfPlayer(message:
            OutputView.ProgramDescription.askNumberOfPlayer)

        let unconfirmedController = GameController(stud: stud, numberOfPlayer: inputNumber)

        guard let controller = unconfirmedController else {
            runProgram = false
            // 게임 종료 메시지 출력
            outputView.showResult(text:
                OutputView.ProgramDescription.quitGame)
            break
        } // 게임 진행
        guard controller.hasEnoughCards(numberOfCard: cardDeck.count()) else {
            runProgram = false
            // 카드 부족 메시지 출력
            outputView.showResult(text:
                OutputView.ProgramDescription.lackOfCard)
            break
        }
        play(stud: controller.studType,
             numberOfPlayer: controller.numberOfPlayer)
    }
}

run()



// MARK: old code

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


