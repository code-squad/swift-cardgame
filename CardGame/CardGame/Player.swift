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
    private(set) var cards: CardPack = []
    private(set) var top: Card?
    private(set) var pokerHand: PokerShowDown.PokerHands

    init(name: String) {
        self.name = name
        pokerHand = .none
    }

    func callNewCard(_ card: Card) {
        cards.append(card)
        cards.sort()
    }

    func openCards() {
        var pokerShowDown: PokerShowDown = PokerShowDown(cards: cards)
        let result = pokerShowDown.openCards()
        pokerHand = result.pokerHand
        top = result.top
    }
    
}
