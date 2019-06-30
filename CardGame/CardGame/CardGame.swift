//
//  CardGame.swift
//  CardGame
//
//  Created by BLU on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGame {
    private(set) var cardDeck: Deck
    private(set) var result: GameResult
    
    mutating func config(menu: GameMenu) {
        switch menu {
        case .initialize:
            cardDeck.reset()
            result = GameResult.initialize(cardDeck.count())
        case .shuffle:
            cardDeck.shuffle()
            result = GameResult.shuffle(cardDeck.count())
        case .draw:
            guard let card = cardDeck.removeOne() else {
                print("\(ErrorMessage.emptyCardDeck)")
                return
            }
            result = GameResult.draw(card, cardDeck.count())
        }
    }
}
