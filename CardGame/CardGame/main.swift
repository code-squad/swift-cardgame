//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func executeCard() {
    let inputView = InputView()
    let outputView = OutputView()
    var deck = Deck()

    var repeatCondition = true
    
    while repeatCondition {
        guard let kindOfFunction = inputView.read() else {
            outputView.errorMsg(.invaildInput)
            return
        }
        switch kindOfFunction {
        case "1":
            deck = deck.reset()
            outputView.resetMsg()
            outputView.countOfDeck(deck)
        case "2":
            deck.shuffle()
            outputView.countOfRestDeck(deck)
        case "3":
            outputView.showMeTheCard(deck.removeOne())
            outputView.countOfDeck(deck)
        case "q", "Q":
            repeatCondition = false
        default:
            outputView.errorMsg(.invaildInput)
        }
    }
    
}
executeCard()
