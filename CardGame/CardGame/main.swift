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
let inputView : InputView = InputView()
let outputView : OutputView = OutputView()
var userDeck : CardDeck = CardDeck()
var playerCards : [[Card]] = []
userDeck.shuffle()

while runCardGame {
    
    outputView.printMessage(.gameSpecies)
    let userGame = inputView.readOneMenu()
    if inputView.isPossibleGameMenu(userGame) == false {
        outputView.printMessage(.invalidMenu)
        continue
    }
    outputView.printMessage(.playersInput)
    let userPlayers = inputView.readOneMenu()
    if inputView.isPossiblePlayers(userPlayers) == false {
        outputView.printMessage(.exceedMessage)
        continue
    }
    
    if userDeck.isPossibleGame(GameInfo(userGame, userPlayers)) == false {
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
