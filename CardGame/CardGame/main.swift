//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let view:CardGameView = CardGameViewImpl()
let deck:CardDeck = CardDeckImpl()

var game:CardGame = CardGameImpl(inputView: view, cardDeck: deck)
game.start()
