//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let input = InputReader.createRandomNumberTuple()
let cardFactory = CardFactory()
let card = cardFactory.createCard(integerTuple: input)
OutputView.printCard(card: card)
