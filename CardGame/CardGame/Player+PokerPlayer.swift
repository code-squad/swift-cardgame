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
    private(set) var name: String = "참가자"
    private(set) var hand: Hand
    
    init(hand: Hand) {
        self.hand = hand
    }
    
    mutating func receive(card: Card) {
        hand.add(card: card)
    }
}
