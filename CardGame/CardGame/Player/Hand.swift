//
//  Hand.swift
//  CardGame
//
//  Created by JieunKim on 10/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

typealias  Hands = [Card: HandRank]
class Hand: CustomStringConvertible {
    private var cards = [Card]()
    private var collectionCards = [Card: Int]()
    private var hands = [Card: HandRank]()
    
    var description: String {
        return "\(cards)"
    }
    
     func add(card: Card) {
        self.cards.append(card)
    }
    
    func clear() {
        self.cards.removeAll()
    }
    
    // card의 count를 dic로 print
    private func makeHands() {
        self.collectionCards = cards.reduce(into: [:]) { counts, card in counts[card, default: 0] += 1 }
        self.hands = HandDecisionMaker.decideGeneralHand(collected: collectionCards)
        
        decideSpecificHands()
    }
    
    private func decideSpecificHands() {
        self.hands = HandDecisionMaker.decideTwoPair(generalHands: hands)
        let straight = HandDecisionMaker.decideStraight(collected: collectionCards)
        if straight.isStraight, let max = straight.maxRank {
            hands[max] = .straight
        }
    }
    
    private func bestHand() -> (key: Card, value: HandRank) {
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

extension Hand: Comparable {
    static func < (lhs: Hand, rhs: Hand) -> Bool {
        if lhs.bestHand().value == rhs.bestHand().value {
            return lhs.bestHand().key < rhs.bestHand().key
        }
        return lhs.bestHand().value < rhs.bestHand().value
    }
    
    static func == (lhs: Hand, rhs: Hand) -> Bool {
        return lhs.bestHand() == rhs.bestHand()
    }
}
