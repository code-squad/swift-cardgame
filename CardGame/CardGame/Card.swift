//
//  Card.swift
//  CardGame
//
//  Created by jang gukjin on 17/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Card{
    private (set) var suit: CardSuit
    private (set) var rank: CardNumber
    
    init(suit: CardSuit, rank: CardNumber){
        self.suit = suit
        self.rank = rank
    }
}
