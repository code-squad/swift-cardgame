//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

while true {
    let inputView = InputView()
    let cardDeck = CardDeck()
    let outputView = OutputView(cardDeck)
    outputView.printNumberOfCard()
    let numberOfCard = inputView.inputCard()
    guard numberOfCard != .invalidCards else { outputView.printInvalidOfCards()
        continue
    }
    outputView.printNumberOfPlayer()
    let numberOfPlayer = inputView.inputPlyer()
    let cardStack = CardStack.init(numberOfCard.rawValue, numberOfPlayer.rawValue)
    guard numberOfPlayer != .invalidPlayer else { outputView.printInvalidOfPlayers()
        continue }
    cardStack.makeCardStack(cardDeck)
    outputView.printCardStack(cardStack)
}


