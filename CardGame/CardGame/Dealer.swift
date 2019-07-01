//
//  CardGame.swift
//  CardGame
//
//  Created by CHOMINJI on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Dealerable {
    func deal() -> Card?
    func handlingDeck(by menu: DeckMenu) -> HandlingDeckResult
}

class Dealer<T: Deck>: Dealerable {
    private let name: String = "딜러"
    private var cards: [Card] = []
    private var deck: T
    
    init(deck: T) {
        self.deck = deck
    }
    
    func deal() -> Card? {
        if let card = deck.removeOne() as? Card {
            return card
        }
        return nil
    }
    
    func handlingDeck(by menu: DeckMenu) -> HandlingDeckResult {
        switch menu {
        case .reset:
            deck.reset()
            return HandlingDeckResult.reset(deck.count)
        case .shuffle:
            deck.shuffle()
            return HandlingDeckResult.shuffle(deck.count)
        case .draw:
            let card = deck.removeOne() as? Card
            return HandlingDeckResult.draw(card, deck.count)
        }
    }
}

extension Dealer: Playerable {
    func take(card: Card) {
        cards.append(card)
    }
    
    func playerName() -> String {
        return name
    }
    
    func playerCards() -> [Card] {
        return cards
    }
}
