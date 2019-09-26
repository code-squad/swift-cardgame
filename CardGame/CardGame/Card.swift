//
/******************************************************************************
 * File Name        : Card.swift
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

struct Card {
    private(set) var suit: Suit
    private(set) var rank: Rank

    public init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    public init() {
        let randomSuit = Suit(rawValue: Int.random(in: 1...4)) ?? Suit.spade
        let randomRank = Rank(rawValue: Int.random(in: 1...13)) ?? Rank.one
        self.init(suit: randomSuit, rank: randomRank)
    }
    
    public init?(_ suit: Int, _ rank: Int) {
        guard let suit = Suit(rawValue: suit)
            ,let rank = Rank(rawValue: rank) else {
                return nil
        }
        self.init(suit: suit, rank: rank)
    }
    
    var description: String {
        return String(suit.description + rank.description)
    }
}
