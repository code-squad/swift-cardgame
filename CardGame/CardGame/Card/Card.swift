//
//  File.swift
//  CardGame
//
//  Created by 윤지영 on 13/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Card: NSObject {
    private let suit: Suit
    private let rank: Rank

    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }

    override var description: String {
        return "\(suit.rawValue)\(rank.value)"
    }

}
