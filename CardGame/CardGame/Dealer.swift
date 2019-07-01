//
//  CardGame.swift
//  CardGame
//
//  Created by CHOMINJI on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Dealerable {
    func handlingDeck(by menu: DeckMenu) -> CardGameResult
}

class Dealer<T: Deck>: Dealerable {
    private var deck: T
    
    init(deck: T) {
        self.deck = deck
    }
    
    func handlingDeck(by menu: DeckMenu) -> CardGameResult {
        switch menu {
        case .reset:
            deck.reset()
            return CardGameResult.reset(deck.count)
        case .shuffle:
            deck.shuffle()
            return CardGameResult.shuffle(deck.count)
        case .draw:
            let card = deck.removeOne() as? Card
            return CardGameResult.draw(card, deck.count)
        }
    }
}
