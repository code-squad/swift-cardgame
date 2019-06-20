//
//  Participant.swift
//  CardGame
//
//  Created by jang gukjin on 21/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Participant: Player {
    private let name: String = "참가자#"
    private (set) var cards: [Card]
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    func getName() -> String {
        return name
    }
}
