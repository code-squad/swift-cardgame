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
    private let rank: RankOfCard
    private let suit: SuitsOfCard
    
    init(rank: RankOfCard, suit: SuitsOfCard) {
        self.rank = rank
        self.suit = suit
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return self.suit.description + self.rank.description
    }
    
    enum SuitsOfCard: Int {
        case spade, heart, diamond, club
        var description: String {
            switch self {
            case .spade : return "♠️"
            case .heart : return "💖"
            case .diamond : return "🔶"
            case .club : return"♣️"
            }
        }
        static let rangeOfSuits = SuitsOfCard.spade.rawValue ... SuitsOfCard.club.rawValue
        static let suits = Array(rangeOfSuits.map({ (index) -> SuitsOfCard in
            SuitsOfCard(rawValue: index)!
        }))
        
        
    }
    
    enum RankOfCard: Int {
        case one = 1, two, three, four, five, six, seven, eight, nine, ten
        case eleven, twelve, thirteen
        static let rangeOfRankOfCard = RankOfCard.one.rawValue ... RankOfCard.thirteen.rawValue
        static let ranks = Array(rangeOfRankOfCard.map({ (index) -> RankOfCard in
            RankOfCard(rawValue: index)!
        }))
        var description: String {
            switch self {
            case .one : return "A"
            case .eleven : return "J"
            case .twelve : return "Q"
            case .thirteen : return "K"
            default: return String(self.rawValue)
            }
        }
    }
}


