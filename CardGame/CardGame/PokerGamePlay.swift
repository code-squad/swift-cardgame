//
//  PokerGamePlay.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 12. 4..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

struct PokerGamePlay {
    private let dealerAction: DealerAction
    private(set) var pokerGame: PokerGame

    init(dealerAction: DealerAction, cardDeck: CardDeck, playerCount: Int, pokerRule: PokerGame.PokerRules) {
        self.dealerAction = dealerAction
        pokerGame = PokerGame.init(cardDeck: cardDeck, playerCount: playerCount, pokerRule: pokerRule)
    }

    mutating func setPokerGame() throws {
        try dealerAction.setPokerGame(pokerGame: &pokerGame)
    }

    mutating func play(pokerRule: PokerGame.PokerRules) throws {
        for _ in 0..<(pokerRule.value-Int(pokerRule.value/2)) {
            do {
                try pokerGame.nextTurn()
            } catch {
                throw PokerGame.GuideMessage.notEnoughCard
            }
        }
    }

}
