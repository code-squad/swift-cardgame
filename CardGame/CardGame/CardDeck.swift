//
//  CardDeck.swift
//  CardGame
//
//  Created by sungchan.you on 2019/09/27.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardDeck {

    private(set) var cards: [Card]
    
    init() {
        self.cards = CardHolder.allCards().shuffled()
    }
    
    private init(cards: [Card]) {
        self.cards = cards
    }

    func count() -> Int {
        return cards.count
    }
    
    func shuffle() -> CardDeck {
        return CardDeck(cards: cards)
    }
    
    func removeOne() -> (cardDeck:CardDeck, removedCard: Card) {
        var newCards = cards
        let card = newCards.removeLast()
        return (CardDeck(cards: newCards), card)
    }
    
    func reset() -> CardDeck {
        return CardDeck(cards: CardHolder.allCards())
    }
}
