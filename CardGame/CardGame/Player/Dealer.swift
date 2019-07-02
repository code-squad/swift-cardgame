//
//  Dealer.swift
//  CardGame
//
//  Created by Daheen Lee on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Dealer: Player {
    static var typeDescription = "딜러"
    var cards: [Card]
    
    init() {
        self.cards = [Card]()
    }
}
