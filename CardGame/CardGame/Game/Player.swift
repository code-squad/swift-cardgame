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
    func showCards() -> String
    func bestHand() -> (key: Card, value: CardSetRanking)
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
    
    func showCards() -> String {
        return "\(cardsInfo.showCards())"
    }
    
    func showOrder() -> String {
        return "\(order)"
    }
    
    func bestHand() -> (key: Card, value: CardSetRanking) {
        return cardsInfo.bestHand()
    }
}
