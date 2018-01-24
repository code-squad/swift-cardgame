//
//  CardStack.swift
//  CardGame
//
//  Created by YOUTH on 2018. 1. 15..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct CardStack: CustomStringConvertible {
    private var cards = [Card]()
    var description: String {
        return cards.description
    }

    init(_ cards: [Card]) {
        self.cards = cards
    }

    func getCards() -> [Card] {
        return self.cards
    }

    func sort(_ cardStack: CardStack) -> [Card] {
        return cards.sorted()
    }

}


