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

while runProgram{

    let inputView = InputView()
    
    let userInput = inputView.askUserInput(text: OutputView.programDescription.chooseMenu.description)

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
        outputView.showResult(text: OutputView.programDescription.quitGame.description)
        break
    case .wrongInput:
        outputView.showResult(text: OutputView.programDescription.wrongInput.description)
    }

}
