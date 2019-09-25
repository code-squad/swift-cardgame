//
//  Card.swift
//  CardGame
//
//  Created by 공명진 on 2019/09/25.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Suit: Int {
    case spades, hearts, diamonds, clubs
    func description() -> String {
        switch self {
        case .spades:
            return "♠︎"
        case .hearts:
            return "♥︎"
        case .diamonds:
            return "♦︎"
        case .clubs:
            return "♣︎"
        }
    }
}

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func description() -> String {
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

protocol CardGame {
    func suitDescribe() -> String
    func rankDescribe() -> String
}

/// 굳이 class로 만들지 않아도 될 것 같아서 struct형식으로 만들었습니다.
struct Card : CardGame {
    private let suit: Suit
    private let rank: Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    func suitDescribe() -> String {
        return suit.description()
    }
    
    func rankDescribe() -> String {
        return rank.description()
    }
}
