//
//  CardStack.swift
//  CardGame
//
//  Created by moon on 2018. 5. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation


struct CardStack {
    
    private var cards: [Card] = [Card]()
    
    mutating func add(cards: [Card]){
        self.cards += cards
    }
}

extension CardStack: CustomStringConvertible {
    var description: String {
        var result: String = "["
        for card in self.cards {
            result += "\(card) ,"
        }
        result.removeLast(2)
        return result + "]"
    }
}
