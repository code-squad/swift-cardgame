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

    let userInput = InputView().askUserInput(text: OutputView.programDescription.chooseMenu.description)
    
    switch userInput {
    case "" :
        outputView.resultMessage(text: OutputView.programDescription.emptyInput.description)
    case "1" :
        cardDeck = cardDeck.reset()
        outputView.resultMessage(text: cardDeck.description)
    case "2" :
        cardDeck.shuffle()
        outputView.resultMessage(text: cardDeck.makeShuffleMessage())
    case "3" :
        let pickedCard = cardDeck.removeOne()
        outputView.showCard(cardToPrint: pickedCard)
        outputView.resultMessage(text: cardDeck.description)
    case "q" :
        runProgram = false
        outputView.resultMessage(text: OutputView.programDescription.quitGame.description)
        break
    default : outputView.resultMessage(text: OutputView.programDescription.wrongInput.description)
    
    }

}
