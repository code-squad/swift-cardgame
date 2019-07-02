//
//  CardDeck.swift
//  CardGame
//
//  Created by Daheen Lee on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

// 프로그램 전체에서 한 개의 CardDeck 만 사용하므로 struct 로 구현
struct CardDeck {
    private var cards = [Card]()
    
    init() {
        reset()
    }
    
    mutating func reset() {
        self.cards = CardFactory.makeAllCards()
        shuffle()
    }
    
    func count() -> Int {
        return cards.count
    }
    
    mutating func shuffle() {
        for i in 0..<cards.count - 1 {
            let randomIndex = Int.random(in: i..<cards.count)
            let temp = cards[i]
            cards[i] = cards[randomIndex]
            cards[randomIndex] = temp
        }
    }
    
    mutating func removeOne() -> Card {
        return cards.removeLast()
    }
    
    mutating func remove(numberOfCards: Int) -> [Card] {
        var removedCards = [Card]()
        for _ in 0..<numberOfCards {
            removedCards.append(self.removeOne())
        }
        return removedCards
    }
    
    func hasEnoughCards(for numberOfCardsPerPlayer: Int, numberOfParticipants: Int) -> Bool {
        let cardsInNeed = numberOfCardsPerPlayer * (numberOfParticipants + 1)
        return cards.count >= cardsInNeed
    }
}
