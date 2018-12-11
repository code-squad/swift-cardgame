//
//  ParticipatablePlayer.swift
//  CardGame
//
//  Created by 윤동민 on 10/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum CardRule {
    case onePair
    case twoPair
    case tripple
    case fourCard
}

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
    
    func judgeMyCard() -> CardRule {
        cards.sorted(by: {$0.number.rawValue < $1.number.rawValue})
        return .onePair
    }
}
