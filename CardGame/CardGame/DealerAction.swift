//
//  DealerAction.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 30..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct DealerAction {

    enum CardAction: Int {
        case none, reset, shuffle, removeOne, cardPacks, pokerGame
    }

    mutating func reset(cardDeck: inout CardDeck) -> CardDeck {
        cardDeck.reset()
        print("카드 전체를 초기화했습니다.")
        print("총 \(cardDeck.count())장의 카드가 있습니다.")
        return cardDeck
    }

    mutating func shuffle(cardDeck: inout CardDeck) -> CardDeck {
        cardDeck.shuffle()
        print("전체 \(cardDeck.count())장의 카드를 섞었습니다.")
        return cardDeck
    }

    mutating func removeOne(cardDeck: inout CardDeck) throws -> CardDeck {
        do {
            let deletedCard: Card = try cardDeck.removeOne()
            print(deletedCard)
            print("총 \(cardDeck.count())장의 카드가 남아있습니다.")
        } catch CardDeck.CardDeckStatus.noCard {
            throw CardDeck.CardDeckStatus.noCard
        }
        return cardDeck
    }

    mutating func getCardPacks(cardDeck: inout CardDeck, packCount: Int) throws -> Array<CardPack> {
        return try cardDeck.getCardPacks(packCount: packCount)
    }

}

typealias PokerGamePlay = DealerAction

extension PokerGamePlay {

    func setPokerGame(pokerGame: inout PokerGame) -> PokerGame {
        do {
            for _ in 1...pokerGame.pokerRule.value {
                try pokerGame.nextTurn()
            }
        } catch {
            print(PokerGame.GuideMessage.notEnoughCard.rawValue)
        }
        return pokerGame
    }

}
