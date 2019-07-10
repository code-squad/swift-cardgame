//
// Participant.swift
//  CardGame
//
//  Created by JieunKim on 09/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Participant: Player {
    private(set) var hand: Hand
    private(set) var name: String
    private let number: Int
    
    init(hand: Hand, number: Int) {
        self.hand = hand
        self.number = number
        self.name = "참가자 #\(number)"
    }
    
    mutating func receive(newCards: Card) {
        hand.add(card: newCards)
    }
}
