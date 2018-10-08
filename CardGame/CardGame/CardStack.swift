//
//  CardStack.swift
//  CardGame
//
//  Created by 이동건 on 21/09/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class CardStack: CustomStringConvertible {
    private var cards: [Card] = []
    
    var description: String {
        var result = "["
        for i in 0..<cards.count {
            result += "\(cards[i])"
            if i != cards.count - 1 {
                result += ","
            }
        }
        return result
    }
    
    init(cards: [Card]) {
        self.cards = cards
    }
}
