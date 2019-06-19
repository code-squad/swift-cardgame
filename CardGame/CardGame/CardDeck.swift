//
//  CardDeck.swift
//  CardGame
//
//  Created by jang gukjin on 18/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardDeck {
    var oneCard: Card?
    private var totalCard: [Card] = []
    
    init(){
        self.reset()
    }
    
    mutating func count() -> Int{
        return totalCard.count
    }
    
    mutating func shuffle(){
        totalCard.shuffle()
    }
    
    mutating func removeOne(){
        oneCard = totalCard[0]
        totalCard.removeFirst()
    }
    
    mutating func reset(){
        totalCard = []
        for suit in CardSuit.allCases {
            for number in CardNumber.allCases {
                totalCard.append(Card(suit: suit, rank: number))
            }
        }
    }
}
