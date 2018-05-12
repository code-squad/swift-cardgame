//
//  AllCardStack.swift
//  CardGame
//
//  Created by moon on 2018. 5. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct AllCardStack {
    private var cardStacks: [CardStack]
    
    init(numberOfCardStacks: Int) {
        self.cardStacks = [CardStack](repeating: CardStack(), count: numberOfCardStacks)
    }
    
    mutating func add(cards: [Card], at cardIndex: Int) {
        self.cardStacks[cardIndex].add(cards: cards)
    }
    
    func descriptionOfCardStack(at index: Int) -> String {
        return self.cardStacks[index].description
    }
}
