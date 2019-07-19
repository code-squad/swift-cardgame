//
//  Dealer+PokerDealer.swift
//  CardGame
//
//  Created by BLU on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Dealer {
    func draw() -> Card?
}

class PokerDealer: Playable, Dealer, CustomStringConvertible {
    private let name: String = "딜러"
    private var hand = Hand()
    private var deck: Deck
    
    var description: String {
        return name
    }
    
    init(deck: Deck) {
        self.deck = deck
    }
    
    func take(card: Card) {
        hand.add(card: card)
    }
    
    func draw() -> Card? {
        return deck.removeOne()
    }
    
    func cards() -> String {
        return String(describing: hand)
    }
}
