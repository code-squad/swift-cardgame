//
//  Card.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 24..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class Card {
    let suit: Suit, rank: Rank

    enum Suit: String {
        case spades = "\u{2660}"
        case hearts = "\u{2665}"
        case diamonds = "\u{2666}"
        case clubs = "\u{2663}"
    }

    enum Rank: Int {
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king

        var value: String {
            switch self {
            case .ace:
                return "A"
            case .jack:
                return "J"
            case .queen:
                return "Q"
            case .king:
                return "K"
            default:
                return String(self.rawValue)
            }
        }
    }

    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }

    var description: String {
        return "\(suit.rawValue)\(rank.value)"
    }
}
