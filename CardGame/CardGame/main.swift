//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

/*
 필요한 cardDeck 객체와 outputView 객체를 제외하고 모두 주석처리 했습니다.
 */

//    let inputView = InputView()
var cardDeck = CardDeck()

//while true {
let outputView = OutputView(cardDeck)
//    outputView.printMenu()
//    let number = inputView.inputNumber()
//    switch number {
//    case "1": _ = cardDeck.reset()
//    outputView.printReset()
//    case "2": _ = cardDeck.shuffle()
//    outputView.printShuffle()
//    case "3":
//    let pickCard = cardDeck.removeOne()
//    outputView.printRemoveOne(pickCard.pick)
//    default: outputView.printinValid()
//    }
//}

let cardStack = CardStack()
let cards = cardStack.makeCardStack(cardDeck)
outputView.printCardStack(cards)


