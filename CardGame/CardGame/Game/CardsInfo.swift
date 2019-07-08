//
//  CardsInfo.swift
//  CardGame
//
//  Created by CHOMINJI on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

typealias Hands = [Card: HandRanking]
class CardsInfo: CustomStringConvertible {
    private var cards: [Card]
    private var collectedCards: [Card: Int] = [:]
    private var hands: Hands = [:]
    
    var description: String {
        return "\(cards)"
    }
    
    init(cards: [Card] = []) {
        self.cards = cards
    }
    
    func add(card: Card) {
        cards.append(card)
    }
    
    private func makeHands() {
        self.collectedCards = cards.reduce(into: [:]) { counts, card in
            counts[card, default: 0] += 1
        }
        self.hands = HandDecider.decideGeneralHand(of: collectedCards)
        
        decideSpecificHand()
    }
    
    private func decideSpecificHand() {
        self.hands = HandDecider.decideTwoPair(of: hands)
        let straight =  HandDecider.decideStraight(of: collectedCards)
        if straight.isStraight, let max = straight.maxRank {
            hands[max] = .straight
        }
    }
    
    private func bestHand() -> (key: Card, value: HandRanking) {
        makeHands()
        var sortedHands = hands.sorted {
            if $0.value == $1.value {
                return $0.key < $1.key
            }
            return $0.value < $1.value
        }
        let maxHand = sortedHands[sortedHands.count - 1]
        return maxHand
    }
}

extension CardsInfo: Comparable {
    static func < (lhs: CardsInfo, rhs: CardsInfo) -> Bool {
        if lhs.bestHand().value == rhs.bestHand().value {
            return lhs.bestHand().key < rhs.bestHand().key
        }
        return lhs.bestHand().value < rhs.bestHand().value
    }
    
    static func == (lhs: CardsInfo, rhs: CardsInfo) -> Bool {
        return lhs.bestHand() == rhs.bestHand()
    }
}
