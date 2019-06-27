//
//  Draw.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Draw: Command {
    var deck: CardDeck
   
    func execute() -> GameResult {
        let card = self.deck.removeOne()
        return GameResult.draw(card: card, remain: self.deck.count())
    }
}
