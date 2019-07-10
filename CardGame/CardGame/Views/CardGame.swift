//
//  CardGame.swift
//  CardGame
//
//  Created by JieunKim on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Playable {
    mutating func play(menu: GameMenu) throws -> HandlingDeckResult
}

struct CardGame: Playable {
    enum Error: Swift.Error {
        case isCardDeckEmpty
        
        var localizedDescription: String {
            switch self {
            case .isCardDeckEmpty:
                return "카드덱이 비어있습니다."
            }
        }
    }
    
    private var deck: Deck
    init(deck: Deck) {
        self.deck = deck
    }
    
    mutating func play(menu: GameMenu) throws -> HandlingDeckResult {
        switch menu {
        case .reset:
            deck.reset()
            return HandlingDeckResult.reset(deck.count())
        case .shuffle:
            deck.shuffle()
            return HandlingDeckResult.shuffle(deck.count())
        case .draw:
            guard let card = deck.removeOne() else {
                throw Error.isCardDeckEmpty
            }
            return HandlingDeckResult.draw(card, deck.count())
        }
    }
    
}
