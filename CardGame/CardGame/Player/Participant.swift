//
//  Participant.swift
//  CardGame
//
//  Created by Daheen Lee on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Participant: Player {
    var cards: [Card]
    let number: Int
    
    var name: String {
        return "참가자#\(number)"
    }
    
    init(number: Int) {
        self.cards = [Card]()
        self.number = number
    }
    
}
