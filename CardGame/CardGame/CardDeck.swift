//
//  CardDeck.swift
//  CardGame
//
//  Created by 이동건 on 23/08/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct CardDeck {
    private var cards: [Card]
    private let stacksHeight = 7
    private var total: Int {
        return cards.count
    }
    
    func isAvailable(_ required: Int? = nil) -> Bool {
        guard let required = required else {
            return total >= GameCategory.minimumRequired // minimum required cards count -> 5 cards, 1 player, 1 dealer
        }
        return required < total
    }
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    mutating func shuffle() {
        let startIndex = 0
        let endIndex = cards.count - 1
        if total < 2 { return }
        
        for i in startIndex ... endIndex {
            let j = Int(arc4random_uniform(UInt32(endIndex - i))) + i
            if i != j {
                cards.swapAt(i, j)
            }
        }
    }
    
    mutating func remove(_ count: Int) -> [Card] {
        var picked: [Card] = []
        for _ in 0..<count {
            let randomIndex = Int(arc4random_uniform(UInt32(total - 1)))
            picked.append(cards.remove(at: randomIndex))
        }
        return picked
    }
    
    mutating func reset(with cards: [Card]) {
        self.cards = cards
    }
    
    mutating func generateStacks() -> [CardStack] {
        var stacks: [CardStack] = []
        for i in 1...stacksHeight {
            let stack: [Card] = remove(i)
            stacks.append(CardStack(cards: stack))
        }
        return stacks
    }
}
