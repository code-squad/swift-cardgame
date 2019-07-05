//
//  Player+PokerPlayer.swift
//  CardGame
//
//  Created by BLU on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Player {
    var name: String { get }
    var hand: Hand { get }
    mutating func receive(card: Card)
}

struct PokerPlayer: Player {
    private(set) var name: String
    private(set) var hand: Hand
    private let number: Int
    
    init(hand: Hand, number: Int) {
        self.hand = hand
        self.name = "참가자#\(number)"
        self.number = number
    }
    
    mutating func receive(card: Card) {
        hand.add(card: card)
    }
}
