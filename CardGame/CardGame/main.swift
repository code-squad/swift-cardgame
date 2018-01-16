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

// MARK: runStack only

/*
 InputView를 거치지 않고 스택만 표시하기위해서는 아예 로직이 달라지기 때문에
 InputView를 제거하는 대신 다른 함수로 묶어서 스택 출력만 하는 함수를 호출했습니다.
 */

func runStack() {

        let cards = cardDeck.makeCards(7)
        let stack = cardDeck.makeStack(cards: cards)
        let player = Player(stack: stack)
        let dealer = Dealer(stack: stack)

    print("player" + player.description)
    print("dealer" + dealer.description)
    print(cardDeck.description)


}

runStack()
