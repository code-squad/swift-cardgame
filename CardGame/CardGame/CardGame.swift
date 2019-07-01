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
    private var result: GameResult
    
    init(cardDeck: Deck) {
        self.cardDeck = cardDeck
        self.result = GameResult.initialize(cardDeck.count())
    }
    
    mutating func run(menu: GameMenu) throws {
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
    }
}

extension CardGame: OutputViewPrintable {
    func printGameResult(handler: (String) -> ()) {
        let resultDescription = String(describing: result)
        handler(resultDescription)
    }
}
