//
//  CardDeck.swift
//  CardGame
//
//  Created by moon on 2018. 5. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct CardDeck: CardDeckable {
    private var cardDeck: Deck = Deck()
    
    private func count() -> Int {
        return self.cardDeck.cards.count
    }
    
    mutating func reset() -> String {
        self.cardDeck = Deck()
        return "카드 전체를 초기화했습니다.\n총 \(self.count())장의 카드가 있습니다."
    }
    
    mutating func shuffle() -> String {
        var count = UInt32(self.count())
        var shuffledCards = [Card]()
        while count != 0 {
            shuffledCards.append(self.cardDeck.cards.remove(at: Int(arc4random_uniform(count))))
            count -= 1
        }
        self.cardDeck.cards = shuffledCards
        return "전체 \(self.count())장의 카드를 섞었습니다."
    }
    
    mutating func removeOne() -> String {
        guard let popedCard = self.cardDeck.cards.popLast() else {
            return "남아있는 카드가 없습니다.\n전"
        }
        return "\(popedCard)\n총 \(self.count())장의 카드가 남아있습니다."
    }
    
}

fileprivate struct Deck {
    var cards: [Card]
    
    init() {
        var cards: [Card] = [Card]()
        for suit in Card.Suit.allCases {
            for number in Card.Number.allCases {
                cards.append(Card(suit: suit, number: number))
            }
        }
        self.cards = cards
    }
}
