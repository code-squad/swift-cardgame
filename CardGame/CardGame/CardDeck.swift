//
//  CardDeck.swift
//  CardGame
//
//  Created by 이진영 on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Deck {
    func count() -> Int
    mutating func shuffle()
    mutating func removeOne() -> Card
    mutating func reset()
    func hasEnoughCard(gameMenu: GameMenu, numberOfPlayer: NumberOfPlayer) -> Bool
}

struct CardDeck: Deck {
    private var cards: [Card] = []
    
    init() {
        makeCards()
    }
    
    func count() -> Int {
        return cards.count
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    mutating func removeOne() -> Card {
        let randomIndex = Int.random(in: 0..<count())
        let card = cards.remove(at: randomIndex)
        
        return card
    }
    
    mutating func reset() {
        cards.removeAll()
        
        makeCards()
    }
    
    func hasEnoughCard(gameMenu: GameMenu, numberOfPlayer: NumberOfPlayer) -> Bool {
        return count() >= gameMenu.numberOfCards * (numberOfPlayer.rawValue + 1)
    }
    
    private mutating func makeCards() {
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases {
                cards.append(Card(suit: suit, rank: rank))
            }
        }
    }
}
