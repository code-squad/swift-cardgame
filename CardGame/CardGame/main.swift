//
//  main.swift
//  CardGame
//
//  Created by Jack
//  2018/01/05
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

var runCardGame : Bool = true
let outputView : OutputView = OutputView()
var userDeck : CardDeck = CardDeck()

while runCardGame {
    outputView.printMessage(.inputMessage)
    let userMenu = InputView().readMenu()
    switch userMenu {
    case "1" :
        userDeck.reset()
        outputView.printMessage(.resetMessage)
    case "2" :
        userDeck.shuffle()
        outputView.printShuffleMessage(userDeck)
    case "3" :
        print(userDeck.removeOne())
        outputView.printRemaingCards(userDeck)
    case "4" :
        outputView.printMessage(.exitCardGame)
        runCardGame = false
    default :
        outputView.printMessage(.invalidMenu)
    }
}
