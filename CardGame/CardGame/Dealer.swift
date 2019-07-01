//
//  Dealer.swift
//  CardGame
//
//  Created by Daheen Lee on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Dealer: Player, CustomStringConvertible {
    var cards: [Card] = [Card]()
    init() {
        
    }
    var description: String {
        return "딜러 \(self.cards)"
    }
}
