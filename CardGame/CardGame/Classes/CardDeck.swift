//
//  CardDeck.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CardDeck: Deck {
    typealias Element = Card
    
    private var cards = [Card]()
    private var isEmpty: Bool {
        return self.count() <= 0
    }
    
    init() {
        self.reset()
    }
    
    func count() -> Int {
        return self.cards.count
    }
    
    func removeOne() -> Card? {
        guard !self.isEmpty else { return nil }
        let randomIndex = Int.random(in: 0..<self.count())
        let card = self.cards.remove(at: randomIndex)
        return card
    }
    
    func shuffle() {
        self.cards.shuffle()
    }
    
    func reset() {
        self.cards = CardFactory.createAll()
        self.shuffle()
    }
    
}
// - MARK: - + Equatable
extension CardDeck: Equatable {
    
    static func == (lhs: CardDeck, rhs: CardDeck) -> Bool {
        guard  lhs.count() == rhs.count() else {
            return false
        }
        var same = true
        for index in 0..<lhs.count() {
            same = same && (lhs.cards[index] == rhs.cards[index])
        }
        return same
    }
}
