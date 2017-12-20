//
//  CardStack.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 18..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct CardStack {
    private var cards: [Card] = []
    
    init() {
        reset()
    }

    mutating func pushCard(_ card: Card) {
        push(card)
    }
    
    func count() -> Int {
        return cards.count
    }
    
    mutating func resetCards() {
        reset()
    }
}

private extension CardStack {
    private mutating func push(_ card: Card) {
        self.cards.append(card)
    }
    
    private mutating func reset() {
        self.cards = []
    }
}

extension CardStack: CustomStringConvertible {
    var description: String {
        var result: String = "["
        result += cards.map({ c -> String in
            c.description + ","
        }).joined()
        
        result.removeLast()
        result += "]"
        return result
    }
}
