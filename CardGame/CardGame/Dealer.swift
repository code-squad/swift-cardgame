//
//  Dealer.swift
//  CardGame
//
//  Created by jang gukjin on 21/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Dealer: Player {
    private let name: String = "딜러"
    private (set) var cards: CardSet
    
    init(cards: CardSet) {
        self.cards = cards
    }
    
    func getName() -> String {
        return name
    }
}
