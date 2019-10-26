//
//  card.swift
//  swift-cardgame
//
//  Created by Jin Hyung Park on 10/26/19.
//

import Foundation

struct Card {
    private let suit: Suit
    private let rank: Rank
    
    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
}

//end of code
