//
//  CardGame.swift
//  CardGame
//
//  Created by CHOMINJI on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CardGame {
    var deck: CardDeck
    
    init(deck: CardDeck) {
        self.deck = deck
    }
    
    func play(of menu: DeckMenu) -> CardGameResult {
        switch menu {
        case .reset:
            deck.reset()
            return CardGameResult.reset(deck.count)
        case .shuffle:
            deck.shuffle()
            return CardGameResult.shuffle(deck.count)
        case .draw:
            let card = deck.removeOne()
            return CardGameResult.draw(card, deck.count)
        }
    }
}
