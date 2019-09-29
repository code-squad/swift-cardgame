//
/******************************************************************************
 * File Name        : CardDeck.swift
 * Description      : CardGame
 *******************************************************************************
 * Copyright (c) 2002-2019 KineMaster Corp. All rights reserved.
 * https://www.kinemastercorp.com/
 *
 * THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
 * KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
 * PURPOSE.
 ******************************************************************************/

import Foundation

class CardDeck {
    private var deck: [Card] = []
    
    private static func CreateDeck() -> [Card] {
        var deck: [Card] = []
        
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                deck.append(Card(suit: suit, rank: rank))
            }
        }
        
        return deck.compactMap{ $0 }
    }
    
    public init() {
        self.reset()
    }
    
    public func count() -> Int {
        return self.deck.count
    }
    
    public func shuffle() {
        self.deck.shuffle()
    }
    
    public func removeOne() -> Card? {
        return self.deck.removeLast()
    }
    
    public func reset() {
        self.deck.removeAll()
        self.deck = CardDeck.CreateDeck()
    }
}
