//
//  Participant.swift
//  CardGame
//
//  Created by jang gukjin on 21/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Participant: Player {
    private let name: String
    private (set) var cards: [Card]
    
    init(name: String, cards: [Card]) {
        self.name = name
        self.cards = cards
    }
    
    func getName() -> String {
        return name
    }
}
