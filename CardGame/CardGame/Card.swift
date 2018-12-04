//
//  Card.swift
//  CardGame
//
//  Created by 조재흥 on 18. 12. 3..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Card : CustomStringConvertible {
    private let suit : Suit, number : Rank
    var description: String {
        return "\(self.suit)\(self.number)"
    }
    
    init(suit:Suit, number:Rank) {
        self.suit = suit
        self.number = number
    }
}
