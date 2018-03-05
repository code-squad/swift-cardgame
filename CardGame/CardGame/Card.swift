//
//  Card.swift
//  CardGame
//
//  Created by Choi Jeong Hoon on 2018. 1. 15..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Card {
    private let rank: RankOfCard
    private let suit: SuitsOfCard
    
    init(_ rank: RankOfCard, _ suit: SuitsOfCard) {
        self.rank = rank
        self.suit = suit
    }
    
    func isNextRank(_ nextCard : Card) -> Bool {
        return self.rank.rawValue == nextCard.rank.rawValue + 1
    }
    
    func isAce () -> Bool {
        return self.rank == .ace
    }
    
    static func getPairTypeCard (_ card: [Card]) -> [String : [Card]] {
        let pairCheck = card.reduce(into: [String:[Card]]()) {
            $0[$1.rank.description, default: []].append($1)
        }
        return pairCheck
    }
}

extension Card: CustomStringConvertible, Comparable {
    var description: String {
        return self.suit.description + self.rank.description
    }
    
    enum SuitsOfCard: Int {
        case spade, heart, diamond, club
        static let rangeOfSuits = SuitsOfCard.spade.rawValue ... SuitsOfCard.club.rawValue
        static let suits = Array(rangeOfSuits.map{ return SuitsOfCard(rawValue:$0) ?? .club })
        var description: String {
            switch self {
            case .spade : return "♠️"
            case .heart : return "💖"
            case .diamond : return "🔶"
            case .club : return"♣️"
            }
        }
    }
    
    enum RankOfCard: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case eleven, twelve, thirteen, ace
        static let rangeOfRankOfCard = RankOfCard.two.rawValue ... RankOfCard.ace.rawValue
        static let ranks = Array(rangeOfRankOfCard.map{ return RankOfCard(rawValue: $0) ?? .ace})
        var description: String {
            switch self {
            case .eleven : return "J"
            case .twelve : return "Q"
            case .thirteen : return "K"
            case .ace : return "A"
            default: return String(self.rawValue)
            }
        }
    }
    
    static func >(lhs: Card, rhs: Card) -> Bool {
        return lhs.rank.rawValue > rhs.rank.rawValue
    }
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.suit == rhs.suit
    }
    static func <(lhs: Card, rhs: Card) -> Bool {
        return lhs.rank.rawValue < rhs.rank.rawValue
    }
}
