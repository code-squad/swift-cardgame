//
//  CardHand.swift
//  CardGame
//
//  Created by 이동영 on 29/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CardHand: Hand {
    typealias Element = Card
    
    private var cards: [Card] = []
    private var score: Score { return Score(cards: self.cards) }
    
    func append(_ gameElement: Card) {
        cards.append(gameElement)
    }
    
    func showAll() -> [Card] {
        return self.cards
    }
    
    func count() -> Int {
        return self.cards.count
    }
    
    func clear() {
        self.cards.removeAll()
    }
    
}
// - MARK: + Score
extension CardHand {
    
    enum Score: Comparable {
        case highCard(top: Card)
        case onePair(top: Card)
        case twoPair(top: Card)
        case trips(top: Card)
        case straight(top: Card)
        case fourCard(top: Card)
    
        init(cards: [Card]) {
            self = .fourCard(top: Card.init(suit: .clubs, rank: .ten))
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
        
        static func < (lhs: CardHand.Score, rhs: CardHand.Score) -> Bool {
            if lhs.ranking > rhs.ranking { return true }
            else if lhs.ranking == rhs.ranking && lhs.top > rhs.top { return true }
            return false
        }
    }
}
// - MARK: - Comparable
extension CardHand {
    static func == (lhs: CardHand, rhs: CardHand) -> Bool {
        return lhs.score == rhs.score
    }
    
    static func < (lhs: CardHand, rhs: CardHand) -> Bool {
        return lhs.score > rhs.score
    }
    
}

