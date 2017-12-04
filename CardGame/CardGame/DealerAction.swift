//
//  DealerAction.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 30..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

struct DealerAction {

    enum CardAction: Int {
        case none, reset, shuffle, removeOne, cardPacks, pokerGame
    }

    mutating func reset(cardDeck: inout CardDeck) {
        cardDeck.reset()
    }

    mutating func shuffle(cardDeck: inout CardDeck) {
        cardDeck.shuffle()
    }

    mutating func removeOne(cardDeck: inout CardDeck) throws -> Card {
        var deletedCard: Card!
        do {
            deletedCard = try cardDeck.removeOne()
        } catch CardDeck.CardDeckStatus.noCard {
            throw CardDeck.CardDeckStatus.noCard
        }
        return deletedCard
    }

    mutating func getCardPacks(cardDeck: inout CardDeck, packCount: Int) throws -> Array<CardPack> {
        return try cardDeck.getCardPacks(packCount: packCount)
    }

}

typealias PokerGameAction = DealerAction

extension PokerGameAction {

    func setPokerGame(pokerGame: inout PokerGame) throws {
        for _ in 1...Int(pokerGame.pokerRule.value/2) {
            do {
                try pokerGame.nextTurn()
            } catch {
                throw PokerGame.GuideMessage.notEnoughCard
            }
        }
    }

}
