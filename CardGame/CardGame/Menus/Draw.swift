//
//  Draw.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Draw<D: Deck>: Command {
    private var deck: D
   
    init(deck: D) {
        self.deck = deck
    }
    
    mutating func execute() -> GameResult {
        let card = self.deck.removeOne() as? Card
        return GameResult.draw(card: card, remain: self.deck.count())
    }
}
