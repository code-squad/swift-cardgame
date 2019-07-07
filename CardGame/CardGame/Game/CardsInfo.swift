//
//  CardsInfo.swift
//  CardGame
//
//  Created by CHOMINJI on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

typealias Hands = [Card: CardSetRanking]
struct CardsInfo {
    private var cards: [Card]
    private var collectedCards: [Card: Int] = [:]
    private var hands: Hands = [:]
    
    init(cards: [Card] = []) {
        self.cards = cards
    }
    
    mutating func makeHands() {
        self.collectedCards = cards.reduce(into: [:]) { counts, card in
            counts[card, default: 0] += 1
        }
        self.hands = HandDecider.decideGeneralHand(of: collectedCards)
        
        decideSpecificHand()
    }
    
    /// twopair, straight를 판단한다.
    mutating private func decideSpecificHand() {
        self.hands = HandDecider.decideTwoPair(of: hands)
        let straight =  HandDecider.decideStraight(of: collectedCards)
        if straight.isStraight, let max = straight.maxRank {
            hands[max] = .straight
        }
    }
    
    mutating func bestHand() -> (key: Card, value: CardSetRanking) {
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
    
    mutating func add(card: Card) {
        cards.append(card)
    }
    
    func showCards() -> [Card] {
        return cards
    }
}
