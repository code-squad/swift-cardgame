//
//  Dealer.swift
//  CardGame
//
//  Created by Elena on 30/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Dealer{
    private var deck: CardDeck
    private var cards: CardStack
    
    init(_ deck: CardDeck) {
        self.deck = deck
        self.cards = CardStack(cards: [])
    }
    
    func removeDeal() -> Card? {
        guard let card = deck.removeOne() else { return nil }
        return card
    }
    
}

extension Dealer: GamePlayer {
    
    func take(card: Card) {
        cards.add(card)
    }
    
    func showCards() -> String {
        return "\(cards)"
    }
    
    func resetCards() {
        cards.reset()
    }
    
}
