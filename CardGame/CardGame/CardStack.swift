//
//  CardStack.swift
//  CardGame
//
//  Created by 조재흥 on 18. 12. 6..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class CardStack : CustomStringConvertible {
    private var cards : [Card]
    var description: String {
        return "\(self.cards)"
    }
    
    init(cards:[Card]) {
        self.cards = cards
    }
    
    func push(card:Card) {
        self.cards.append(card)
    }
    
    func pop() -> Card? {
        return cards.popLast()
    }
    
    func peek() -> Card? {
        return cards.last
    }
    
    func score() -> Int {
        return ScoreCalculator.calculateScore(cards: self.cards)
    }
}
