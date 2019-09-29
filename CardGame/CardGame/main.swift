//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

var menuItem = InputView.inputMenu()
let cardDeck = CardDeck()

while (menuItem != 4) {
    OutputView.printResult(cardDeck: cardDeck, menuItem: menuItem)
    menuItem = InputView.inputMenu()
}
