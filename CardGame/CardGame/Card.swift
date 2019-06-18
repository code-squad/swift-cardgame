//
//  Card.swift
//  CardGame
//
//  Created by jang gukjin on 17/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Card{
    private (set) var suit: String
    private (set) var rank: Int
    
    init(suit: CardSuit, rank: CardNumber){
        self.suit = suit.suit
        self.rank = rank.rawValue
    }
    
    func printCard() {
        print("\(suit)\(rank.description)")
    }
}
