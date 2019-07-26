//
//  CardGame.swift
//  CardGame
//
//  Created by JH on 17/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGame {
    
    enum GameType: Int {
        case sevenCard = 7
        case fiveCard = 5
    }
    var deck = CardDeck()
    var gameType: GameType = .fiveCard
    var players = [Player]()
    
    mutating func setGameType(_ type: GameType) {
        self.gameType = type
    }
    
    mutating func setPlayer(_ playerCount: Int) {
        players = [Player](repeating: Player(), count: playerCount)
    }
    
    // 특정 플레이어에케 카드를 게임종류에 따라 나눠줌.
    private mutating func giveCards(to playerIndex: Int) {
        for _ in 0 ..< gameType.rawValue {
            guard let card = deck.removeOne() else {
                return
            }
            players[playerIndex].addCard(card: card)
        }
    }
    
    mutating func giveCardsToAllPlayers() {
        for playerindex in 0 ..< players.count {
            giveCards(to: playerindex)
        }
    }
    
    mutating func resetCards() {
        for playerindex in 0 ..< players.count {
            players[playerindex].resetHands()
        }
    }
}
