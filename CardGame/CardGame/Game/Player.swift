//
//  Player.swift
//  CardGame
//
//  Created by CHOMINJI on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol PlayerPrintable {
    func playerInfoToPrint() -> String
}

protocol Playerable: PlayerPrintable {
    func take(card: Card)
}

class Player {
    private var order: Int
    private var cards: [Card]
    
    init(order: Int = 0, cards: [Card] = []) {
        self.order = order
        self.cards = cards
    }
    
    func playerOrder() -> Int {
        return order
    }
}

extension Player: Playerable {
    func take(card: Card) {
        cards.append(card)
    }
    
    func playerInfoToPrint() -> String {
        let info = "참가자 #\(order) \(cards)"
        return info
    }
}
