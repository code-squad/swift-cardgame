//
//  Draw.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Draw: Menu {
    
    func action(cards: CardDeck) -> GameResult {
        let card = cards.removeOne()
        return GameResult.draw(card: card, remain: cards.count())
    }
}
