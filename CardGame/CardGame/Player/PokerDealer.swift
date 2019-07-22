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

class PokerDealer: Dealer {
    private(set) var name: String = "딜러"
    private(set) var hand: Hand
    private(set) var deck: Deck
    
    init(hand: Hand, deck: Deck) {
        self.hand = hand
        self.deck = deck
    }
    
     func receive(newCards: Card) {
        hand.add(card: newCards)
    }
    
     func give() -> Card? {
        return deck.removeOne()
    }
    
    func haveCards(requirement: Int) -> Bool {
        return deck.count() - requirement > 0
    }
    
}
