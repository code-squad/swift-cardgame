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
        return Card(suit, rank)
    }
    
    static func run() {
        var cardDeck = CardDeck.init()
        while(!cardDeck.isEmpty) {
            let numSelected = InputView.readInput()
            guard let menuSelected = MenuController.getMenu(of: numSelected) else { continue }
            let result = cardDeck.makeResult(of: menuSelected)
            print(result)
        }
    }

}

Main.run()
