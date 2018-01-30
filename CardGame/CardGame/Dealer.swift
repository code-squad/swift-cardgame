//
//  Dealer.swift
//  CardGame
//
//  Created by Choi Jeong Hoon on 2018. 1. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Dealer {
    private var deck: CardDeck = CardDeck()
    
    init(_ deck: CardDeck) {
        self.deck = deck
    }
    
    var deckDescription: CardDeck {
        return self.deck
    }
    mutating func dealCards(_ gameSpecies: CardGameInfo.GameSpecies) -> [Card] {
        var cards: [Card] = []
        for _ in 0 ..< gameSpecies.rawValue {
            cards.append(self.deck.pickCard())
        }
        return cards
    }
    
    var remainedCard: Int {
        return self.deck.count
    }

    func makeName(_ index: Int) -> String {
        return "참가자\(index)#딜러 "
    }
    
}
