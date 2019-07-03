//
//  Score.swift
//  CardGame
//
//  Created by 이동영 on 03/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Score: Comparable, CustomStringConvertible {
    case highCard(top: Card)
    case onePair(top: Card)
    case twoPair(top: Card)
    case trips(top: Card)
    case straight(top: Card)
    case fourCard(top: Card)
    
    var description: String {
        switch self {
        case .highCard(let card):
            return "\(card) - 하이카드"
        case .onePair(let card):
            return "\(card) - 원페어"
        case .twoPair(let card):
            return "\(card) - 투페어"
        case .trips(let card):
            return "\(card) - 트리플"
        case .straight(let card):
            return "\(card) - 스트레이트"
        case .fourCard(let card):
            return "\(card) - 포카드"
        }
    }
    
    var ranking: Int {
        switch self {
        case .highCard:
            return 0
        case .onePair:
            return 1
        case .twoPair:
            return 2
        case .trips:
            return 3
        case .straight:
            return 4
        case .fourCard:
            return 5
        }
    }
    
    var top: Card {
        switch self {
        case .highCard(let card):
            return card
        case .onePair(let card):
            return card
        case .twoPair(let card):
            return card
        case .trips(let card):
            return card
        case .straight(let card):
            return card
        case .fourCard(let card):
            return card
        }
    }
    
    static func == (lhs: Score, rhs: Score) -> Bool {
        let sameRanking = lhs.ranking == rhs.ranking
        let sameTopCard = lhs.top == rhs.top
        return sameRanking && sameTopCard
    }
    
    static func < (lhs: Score, rhs: Score) -> Bool {
        let higherRank = lhs.ranking < rhs.ranking
        let higherTopCard = lhs.ranking == rhs.ranking && lhs.top < rhs.top
        return higherRank || higherTopCard
    }
    
}

