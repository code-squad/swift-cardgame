//
//  Dealer.swift
//  CardGame
//
//  Created by 공명진 on 2019/10/01.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Dealer: Participant {
    
    private let cards: [Card]
    private let name: String
    
    init(name: String, cards: [Card]) {
        self.name = name
        self.cards = cards
    }

    func description() {
        print("\(self.name) ", terminator: "")
        print(cards.map({$0.suitDescribe()+$0.rankDescribe()}))
    }
}
