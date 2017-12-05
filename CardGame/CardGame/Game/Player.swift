//
//  Player.swift
//  CardGame
//
//  Created by 심 승민 on 2017. 12. 4..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Player {
    private var cardStack: CardStack
    private(set) var isDealer: Bool
    init(_ isDealer: Bool) {
        self.cardStack = CardStack()
        self.isDealer = isDealer
    }

    func resetStack() {
        self.cardStack.reset()
    }

    func showAllCards() -> CardStack {
        return self.cardStack
    }

    func showACard() -> Card? {
        return self.cardStack.peek()
    }

    func take(a newCard: Card?) {
        guard let card = newCard else { return }
        self.cardStack.push(card: card)
    }

    func take(cards: CardStack) {
        for card in cards {
            self.take(a: card)
        }
    }

}
