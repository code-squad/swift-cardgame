//
//  Shuffle.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Shuffle: Menu {
    
    func action(cards: CardDeck) -> GameResult {
        cards.shuffle()
        return GameResult.shuffle(remain: cards.count())
    }
}
