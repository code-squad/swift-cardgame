//
//  Dealer.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 28..
//  Copyright © 2017년 YUAMING. All rights reserved.
//

import Foundation

struct Dealer {
    private var deck: Deck
    private let hand: Hand
    private let name: String = "딜러"
    
    init(deck: Deck) {
        self.hand = Hand(cards: [])
        self.deck = deck
    }
    
    init(hand: Hand, deck: Deck) {
        self.hand = hand
        self.deck = deck
    }
    
    var handInformation: Hand {
        return self.hand
    }
    
    var nameInformation: String {
        return self.name
    }
    
    var remainCards: Deck {
        return self.deck
    }
    
    mutating func dealCards(_ cardCount: Int) throws -> [Card] {
        var cards: [Card] = []
        
        for _ in 0..<cardCount {
            self.deck.shuffle()
            cards.append(try self.deck.remove())
        }
        
        return cards
    }
}
