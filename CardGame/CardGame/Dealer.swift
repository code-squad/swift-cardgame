//
//  Dealer.swift
//  CardGame
//
//  Created by 이진영 on 15/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Dealer: Dealable {
    private var cardDeck: CardDeck
    private var cards: [Card] = []
    private let name = "딜러"
    
    init(cardDeck: CardDeck) {
        self.cardDeck = cardDeck
    }
    
    func receive(card: Card) {
        cards.append(card)
    }
    
    func give() -> Card {
        return cardDeck.removeOne()
    }
    
    func reset() {
        cards.removeAll()
    }
    
    func getPlayerInformation(handler: (String, [Card]) -> ()) {
        handler(name, cards)
    }
}
