//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct Main {

    private static func makeRandomCard() -> Card {
        let suit = Suit.allCases.randomElement() ?? .spades
        let rank = Rank.allCases.randomElement() ?? .A
        return Card(suit: suit, rank: rank)
    }

    static func run() {
        let card = makeRandomCard()
        OutputView.show(card)
    }

}

Main.run()
