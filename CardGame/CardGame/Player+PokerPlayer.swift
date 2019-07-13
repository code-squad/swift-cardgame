//
//  Player+PokerPlayer.swift
//  CardGame
//
//  Created by BLU on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Player {
    func cards() -> String
    mutating func receive(card: Card)
}

struct PokerPlayer: Player, CustomStringConvertible {
    private let name: String
    private var hand = Hand()
    private let number: Int
    
    var description: String {
        return name
    }
    
    init(number: Int) {
        self.name = "참가자#\(number)"
        self.number = number
    }
    
    mutating func receive(card: Card) {
        hand.add(card: card)
    }
    
    func cards() -> String {
        return String(describing: hand)
    }
}
