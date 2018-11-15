//
//  CardStack.swift
//  CardGame
//
//  Created by 윤지영 on 15/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct CardStack: CustomStringConvertible {
    private var cards: [Card]

    init(cards: [Card]) {
        self.cards = cards
    }

    var description: String {
        let allCards = cards
            .map { "\($0)" }
            .joined(separator: ", ")
        return "[\(allCards)]"
    }
}
