//
//  Player.swift
//  CardGame
//
//  Created by CHOMINJI on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Playerable {
    func take(card: Card)
    func showCards() -> CardsInfo
    func bestHand() -> (key: Card, value: HandRanking)
}

class Player {
    private var order: Int
    private var cardsInfo: CardsInfo
    
    init(order: Int = 0) {
        self.order = order
        self.cardsInfo = CardsInfo()
    }
}

extension Player: Playerable {
    func take(card: Card) {
        cardsInfo.add(card: card)
    }
    
    func showCards() -> CardsInfo {
        return cardsInfo
    }
    
    func showOrder() -> Int {
        return order
    }
}

extension Player: Comparable {
    static func < (lhs: Player, rhs: Player) -> Bool {
        return compareTwoValues(lhs, rhs)
    }
    
    static func < (lhs: Player, rhs: Dealer<CardDeck>) -> Bool {
        return compareTwoValues(lhs, rhs)
    }
    
    static func < (lhs: Dealer<CardDeck>, rhs: Player) -> Bool {
        return compareTwoValues(lhs, rhs)
    }
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.bestHand == rhs.bestHand
    }
    
    static private func compareTwoValues<L: Player, R: Player>(_ lhs: L, _ rhs: R) -> Bool {
        if lhs.bestHand.value == rhs.bestHand.value {
            return lhs.bestHand.key < rhs.bestHand.key
        }
        return lhs.bestHand.value < rhs.bestHand.value
    }
}
