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
var playerCards : [[Card]] = []
userDeck.shuffle()

while runCardGame {
    
    outputView.printMessage(.gameSpecies)
    let userGame = InputView().readMenu()
    if userGame != 1 && userGame != 2  {
        outputView.printMessage(.invalidMenu)
        continue
    }
    outputView.printMessage(.playersInput)
    let userPlayers = InputView().readMenu()
    if userPlayers > 4 {
        outputView.printMessage(.exceedMessage)
        continue
    }
    
    if userDeck.count() < userGame * (userPlayers + 1) {
        outputView.printMessage(.lackOfCards)
        outputView.printMessage(.exitCardGame)
        break
    }
    
    if userGame == 2 {
        outputView.printPlayerCards(userDeck.generateStacks(5, numberOfPlayers: userPlayers))
        continue
    }
    outputView.printPlayerCards(userDeck.generateStacks(numberOfPlayers: userPlayers))
    
}
