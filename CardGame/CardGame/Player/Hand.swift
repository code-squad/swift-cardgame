//
//  Hand.swift
//  CardGame
//
//  Created by JieunKim on 10/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Hand: CustomStringConvertible {
    private var cards = [Card]()
    
    var description: String {
        return "\(cards)"
    }
    
    mutating func add(card: Card) {
        self.cards.append(card)
    }
    
}
