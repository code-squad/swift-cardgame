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
    
    userDeck.shuffle()
    outputView.printStacks(userDeck.generateStacks())
    runCardGame = false

}
