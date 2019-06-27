//
//  CardGame.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGame {
    var deck = CardDeck()
    
    mutating func run(menu: Menu) -> GameResult {
        let result = menu.action(cards: self.deck)
        return result
    }
}
