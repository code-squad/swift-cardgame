//
//  PokerGamePlay.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 12. 4..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

struct PokerGamePlay {
    private let dealer: Dealer
    private var pokerRule: PokerGame.PokerRules
    private var playerCount: Int
    private var pokerGame: PokerGame

    init(dealer: Dealer, cardDeck: CardDeck) {
        self.dealer = dealer
        pokerRule = dealer.selectGameRule()
        playerCount = dealer.selectPlayerCount()
        pokerGame = PokerGame.init(cardDeck: cardDeck, playerCount: playerCount, pokerRule: pokerRule)
    }

    mutating func setPokerGame() -> PokerGame {
        return dealer.dealerAction.setPokerGame(pokerGame: &pokerGame)
    }

    mutating func play() -> Bool {
        let shouldMoreCard: Bool = dealer.shouldMoreCard()
        for _ in 0..<(pokerRule.value-Int(pokerRule.value/2)) where shouldMoreCard {
            do {
                try pokerGame.nextTurn()
            } catch {
                print(PokerGame.GuideMessage.notEnoughCard.rawValue)
                break
            }
        }
        return shouldMoreCard
    }

}
