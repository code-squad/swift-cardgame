//
//  Player.swift
//  CardGame
//
//  Created by 윤지영 on 16/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Player: GamePlayer {
    private let number: Int
    private var cards: CardStack

    init(number: Int) {
        self.number = number
        self.cards = CardStack(cards: [])
    }

    func take(card: Card) {
        cards.add(card)
    }

    func showCards() -> String {
        return "참가자#\(number) \(cards)"
    }

    func resetCards() {
        cards.reset()
    }

}
