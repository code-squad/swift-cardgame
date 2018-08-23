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
    private var pickedCards: [Card] = []
    private var pickedCardsIndexs: [Int] = []
    
    var count: Int {
        return cards.count - pickedCards.count
    }
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    mutating func shuffle() {
        let startIndex = 0
        let endIndex = cards.count - 1
        if count < 2 { return }
        
        for i in startIndex ... endIndex {
            let j = Int(arc4random_uniform(UInt32(endIndex - i))) + i
            if i != j && !pickedCardsIndexs.contains(j){
                cards.swapAt(i, j)
            }
        }
    }
    
    mutating func removeOne() -> Card {
        let randomIndex = Int(arc4random_uniform(UInt32(count - 1)))
        let pickedCard = cards[randomIndex]
        pickedCards.append(pickedCard)
        pickedCardsIndexs.append(randomIndex)
        return pickedCard
    }
    
    mutating func reset() {
        pickedCards.removeAll()
        pickedCardsIndexs.removeAll()
    }
}
