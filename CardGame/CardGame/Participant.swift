//
//  Participant.swift
//  CardGame
//
//  Created by Daheen Lee on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Participant: Player, CustomStringConvertible {
    let number: Int
    var cards: [Card] = [Card]()
    
    init(number: Int) {
        self.number = number
    }
    
    var description: String {
        return "참가자 #\(self.number) \(self.cards)"
    }
    
}
