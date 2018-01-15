//
//  Card.swift
//  CardGame
//
//  Created by Choi Jeong Hoon on 2018. 1. 15..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

// 카드 객체
class Card {
    private let rank: CardSet.Rank
    private let suit: CardSet.Suit
    
    init(rank: CardSet.Rank, suit: CardSet.Suit) {
        self.rank = rank
        self.suit = suit
    }
    
    func makeOneCard () -> String {
        return suit.rawValue + rank.description()
    }
}


