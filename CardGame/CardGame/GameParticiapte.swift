//
//  ParticipatablePlayer.swift
//  CardGame
//
//  Created by 윤동민 on 10/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class GameParticipate {
    var cards: [Card]
    var name: String
    
    init(_ name: String) {
        cards = []
        self.name = name
    }

    func receiveCard(_ cards: [Card]) {
        self.cards = cards
    }
}
