//
//  Participant.swift
//  CardGame
//
//  Created by Daheen Lee on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Participant: Player {
    static var typeDescription = "참가자"
    var cards: [Card]
    
    init() {
        self.cards = [Card]()
    }
}
