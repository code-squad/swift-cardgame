//
//  Player.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 28..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class Player {
    let name: String
    private(set) var cards: Array<Card> = []

    init(name: String) {
        self.name = name
    }

    func getNewCard(_ card: Card) {
        cards.append(card)
    }

}
