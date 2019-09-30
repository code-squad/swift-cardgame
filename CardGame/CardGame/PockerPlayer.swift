//
//  PockerPlayer.swift
//  CardGame
//
//  Created by sungchan.you on 2019/09/29.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct PockerPlayer: PockerPlayable {

    private(set) var name: String
    private(set) var cards: [Card]
    
    init(name: String, cards: [Card]) {
        self.name = name
        self.cards = cards
    }
    
    func updated(by cards: [Card]) -> PockerPlayable {
        return PockerPlayer(name: name, cards: cards)
    }
}
