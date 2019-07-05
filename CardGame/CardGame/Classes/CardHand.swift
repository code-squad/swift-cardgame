//
//  CardHand.swift
//  CardGame
//
//  Created by 이동영 on 29/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CardHand: Hand {
    
    typealias Element = Card
    
    private var cards: [Card] = [] { didSet { cards.sort() } }
    private var score: Score? { return ScoreFactory.create(self.cards) }
    
    func append(_ gameElement: Card) {
        cards.append(gameElement)
    }
    
    func showAll() -> [Card] {
        return self.cards
    }
    
    func count() -> Int {
        return self.cards.count
    }
    
    func clear() {
        self.cards.removeAll()
    }
    
    
}
// - MARK: - Comparable
extension CardHand: Comparable {
    static func == (lhs: CardHand, rhs: CardHand) -> Bool {
        return lhs.score == rhs.score
    }
    
    static func < (lhs: CardHand, rhs: CardHand) -> Bool {
        guard let left = lhs.score , let right = rhs.score else {
            return false
        }
        return left < right
    }
    
}
// - MARK: - Printable
extension CardHand: SingleValuePrintable {
    
    func print(logic: @escaping (String) -> Void) {
        guard let score = score else { return }
        logic("\(self.cards) \(score)")
    }
    
}
