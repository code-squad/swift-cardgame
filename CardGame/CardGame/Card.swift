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

    // 카드의 모양 4종류 중 하나를 채택하기 위해 enum 사용.
    enum Suit: String {
        case spades = "\u{2660}"
        case hearts = "\u{2665}"
        case diamonds = "\u{2666}"
        case clubs = "\u{2663}"
    }

    // 카드의 숫자를 1~13까지로 고정하기 위해 enum 사용.
    enum Rank: Int {
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king

        // 1, 11, 12, 13 은 특수하게 숫자대신 문자 출력
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
