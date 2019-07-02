//
//  CardDeck.swift
//  CardGame
//
//  Created by CHOMINJI on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Deck {
    associatedtype Element
    var count: Int { get }
    func reset()
    func shuffle()
    func removeOne() -> Element?
}

class CardDeck: Deck {
    typealias Element = Card
    
    private var cards: [Card] = []
    
    var count: Int {
        return cards.count
    }
    
    init() {
        self.reset()
        self.shuffle()
    }
    
    func reset() {
        cards.removeAll()
        cards = DeckMaker.makeElements()
    }
    
    func shuffle() {
        cards = cards.shuffled()
    }
    
    func removeOne() -> Card? {
        guard let lastCard = cards.popLast() else { return nil }
        return lastCard
    }
}
