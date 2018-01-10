//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let card = Card(suit: CardDeck.Suit.heart, denomination: CardDeck.Denomination.one)

let outputView = OutputView()
outputView.showResult(cardToPrint: card)



