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
    case "1": outputView.printReset(cardDeck.reset())
    case "2": outputView.printShuffle(cardDeck.shuffle())
    case "3": let removeCard = cardDeck.removeOne()
    outputView.printRemoveOne(removeCard.basic, removeCard.pick)
    default: outputView.printinValid()
    }
}
