//
//  PockerPlayer.swift
//  CardGame
//
//  Created by sungchan.you on 2019/09/29.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct PockerPlayer: CustomStringConvertible {
    private(set) var name: String
    private(set) var cards: [Card]
    
    init(name: String) {
        self.name = name
        self.cards = []
    }
    
    mutating func addCard(card: Card) {
        self.cards.append(card)
    }
    
    mutating func reset() {
        self.cards.removeAll()
    }
    
    var description: String {
        return "[\(cards.map { $0.description }.joined(separator: ", "))]"
    }
}
