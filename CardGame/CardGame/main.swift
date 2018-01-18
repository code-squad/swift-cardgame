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
        if stud == .quitGame {
            outputView.showResult(text: OutputView.ProgramDescription.quitGame)
            break
        } else {
            let inputNumber = gameInput.askNumberOfPlayer(message:
                OutputView.ProgramDescription.askNumberOfPlayer)
            do {
                let controller = try GameController(stud: stud, numberOfPlayer: inputNumber)
                // 게임 진행
                guard controller.hasEnoughCards(numberOfCard: cardDeck.count()) else {
                    runProgram = false
                    // 카드 부족 메시지 출력
                    outputView.showResult(text:
                        OutputView.ProgramDescription.lackOfCard)
                    break
                }
                play(stud: controller.studType,
                     numberOfPlayer: controller.numberOfPlayer)
            } catch let error as GameController.InitError {
                switch error {
                case .quit: outputView.showResult(text:error)
                    break
                case .wrongMenu: outputView.showResult(text:error)
                case .wrongPlayerNumber: outputView.showResult(text:error)
                }
                continue
            } catch {
                print("unknown error")
                continue
            }
        }
    }
}

run()

