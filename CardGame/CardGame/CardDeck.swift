//
//  CardDeck.swift
//  CardGame
//
//  Created by moon on 2018. 5. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct CardDeck: CardDeckConvertible {
    
    enum Error: Swift.Error {
        case outOfDeck
        
        var errorMessage: String {
            switch self {
            case .outOfDeck:
                return "덱의 카드가 부족하여 게임이 종료됩니다."
            }
        }
    }
    
    private var deck: Deck = Deck()
    
    mutating func resetCard() {
        self.deck = Deck()
    }
    
    mutating func shuffleCard() {
        var shuffledCards = [Card]()
        for count in stride(from: UInt32(self.deck.cards.count), to: 0, by: -1) {
            shuffledCards.append(self.deck.cards.remove(at: Int(arc4random_uniform(count))))
        }
        self.deck.cards = shuffledCards
    }
    
    mutating func remove(numberOfCards: Int) throws -> [Card] {
        guard numberOfCards < self.deck.cards.count else {
            throw CardDeck.Error.outOfDeck
        }
        var removedCards: [Card] = [Card]()
        for _ in 0..<numberOfCards {
            if let removedCard = self.deck.cards.popLast() {
                removedCards.append(removedCard)
            }
        }
        return removedCards
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
