//
//  CardGame.swift
//  CardGame
//
//  Created by BLU on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGame {
    
    enum Error: Swift.Error {
        case isCardDeckEmpty
        
        var localizedDescription: String {
            switch self {
            case .isCardDeckEmpty:
                return "카드덱이 비어있습니다."
            }
        }
    }
    
    private var cardDeck: Deck
    
    init(cardDeck: Deck) {
        self.cardDeck = cardDeck
    }
    
    mutating func run(menu: GameMenu) throws -> GameResult {
        let result: GameResult
        switch menu {
        case .initialize:
            cardDeck.reset()
            result = GameResult.initialize(cardDeck.count())
        case .shuffle:
            cardDeck.shuffle()
            result = GameResult.shuffle(cardDeck.count())
        case .draw:
            guard let card = cardDeck.removeOne() else {
                throw Error.isCardDeckEmpty
            }
            result = GameResult.draw(card, cardDeck.count())
        }
        return result
    }
}
