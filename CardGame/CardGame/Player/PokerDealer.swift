//
//  Dealer.swift
//  CardGame
//
//  Created by JieunKim on 09/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Dealer: Player {
    func give() -> Card?
    func haveCards(requirement: Int) -> Bool
}

class PokerDealer: PokerPlayer, Dealer {
    private(set) var deck: Deck
    
    init(deck: Deck, number: Int, name: String) {
        self.deck = deck
        super.init(number: 0, name: "딜러")
    }
    
    func give() -> Card? {
        return deck.removeOne()
    }
    
    func haveCards(requirement: Int) -> Bool {
        return deck.count() - requirement > 0
    }
    
}
