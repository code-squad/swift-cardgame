//
//  DealerAction.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 30..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

struct DealerAction {
    private var cardDeck: CardDeck

    init() {
        cardDeck = CardDeck()
    }

    enum CardAction: Int {
        case none, reset, shuffle, removeOne, cardPacks, pokerGame
    }

    func isRemain() -> Bool {
        return cardDeck.count() > 0
    }

    func count() -> Int {
        return cardDeck.count()
    }

    mutating func reset() {
        cardDeck.reset()
    }

    mutating func shuffle() {
        cardDeck.shuffle()
    }

    mutating func removeOne() throws -> Card {
        var deletedCard: Card!
        do {
            deletedCard = try cardDeck.removeOne()
        } catch CardDeck.CardDeckStatus.noCard {
            throw CardDeck.CardDeckStatus.noCard
        }
        return deletedCard
    }

    mutating func getCardPacks(packCount: Int) throws -> Array<CardPack> {
        return try cardDeck.getCardPacks(packCount: packCount)
    }

}
