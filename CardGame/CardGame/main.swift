//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func run() {
    let suit: Suit = Suit.club
    let number: Number = Number.ace
    let card: Card = Card(suit, number)
    print(card.description)
}

run()
