//
// Participant.swift
//  CardGame
//
//  Created by JieunKim on 09/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class PokerPlayer: Player {
    
    private(set) var hand = Hand()
    private(set) var name: String
    private let number: Int
    
    init(number: Int) {
        self.number = number
        self.name = "참가자 #\(number)"
    }
    
     func receive(newCards: Card) {
        hand.add(card: newCards)
    }
    
    func clearHand() {
        self.hand.clear()
    }
}
