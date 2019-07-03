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
    
    private var cards: [Card] = []
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
// - MARK: + Score
extension CardHand {
    
    
}
// - MARK: - Comparable
extension CardHand {
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

