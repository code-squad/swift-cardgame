//
//  CardStack.swift
//  CardGame
//
//  Created by Elena on 31/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CardDataCollection: CustomStringConvertible {
    private var cards: [Card]
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    func add(_ card: Card) {
        cards.append(card)
    }
    
    func reset() {
        cards.removeAll()
    }
    
    var description: String {
        let cardLump = cards.map { "\($0)" }.joined(separator: ", ")
        return "[\(cardLump)]"
    }
}

class CardStack: CustomStringConvertible {
    private var cardStacks: [CardStack] = []
    
    init(_ cardDeck: CardDeck, _ number: Int) {
        var cardDeck = cardDeck
        for index in 0..<number {
            guard let cardStack = cardDeck.removeMultiple(index) else { break }
            self.cardStacks.append(cardStack)
        }
    }
    
    var description: String {
        let cardLumps = cardStacks.map { "\($0)" }.joined(separator: "\n")
        return cardLumps
    }
}
