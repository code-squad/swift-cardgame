//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let inputView = InputView()
let outputView = OutputView()
var cardDeck = CardDeck()

while true {
    outputView.printMenu()
    let number = inputView.inputNumber()
    switch number {
    case "1": _ = cardDeck.reset()
    outputView.printReset(cardDeck)
    case "2": _ = cardDeck.shuffle()
    outputView.printShuffle(cardDeck)
    case "3":
        let pickCard = cardDeck.removeOne()
        outputView.printRemoveOne(pickCard.pick,cardDeck)
    default: outputView.printinValid()
    }
}
