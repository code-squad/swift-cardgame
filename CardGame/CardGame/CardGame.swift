//
//  CardGame.swift
//  CardGame
//
//  Created by 이진영 on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGame {
    private var cardDeck: CardDeck
    
    init(cardDeck: CardDeck) {
        self.cardDeck = cardDeck
    }
    
    mutating func run(menu: Menu) -> GameResult {
        var result: GameResult
        
        switch menu {
        case .reset:
            cardDeck.reset()
            result = GameResult.reset(cardDeck.count())
        case .shuffle:
            cardDeck.shuffle()
            result = GameResult.shuffle(cardDeck.count())
        case .draw:
            let drawCard = cardDeck.removeOne()
            
            result = GameResult.draw(drawCard!, cardDeck.count())
        case .exit:
            result = GameResult.exit
        }
        
        return result
    }
}
