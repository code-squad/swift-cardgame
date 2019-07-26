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
    var dealer = Player(name: "딜러")
    
    mutating func setGameType(_ type: GameType) {
        self.gameType = type
    }
    
    mutating func setPlayer(_ playerCount: Int) throws {
        var players = [Player]()
        guard playerCount > 0 else {
            throw GameError.incorrectPlayerCount
        }
        for index in 0 ..< playerCount {
            players.append(Player(name: "참가자#\(index+1)"))
        }
        self.players = players
        
    }
    
    // 특정 플레이어에케 카드를 게임종류에 따라 나눠줌.
    private mutating func giveCards(to playerIndex: Int) throws {
        for _ in 0 ..< gameType.rawValue {
            guard let card = deck.removeOne() else {
                throw GameError.notEnoughCard
            }
            players[playerIndex].addCard(card: card)
        }
    }

    mutating func giveCardsToAllPlayers() throws {
        for playerindex in 0 ..< players.count {
            try giveCards(to: playerindex)
        }
        try giveCardsToDealer()
    }
    
    private mutating func giveCardsToDealer() throws {
        for _ in 0 ..< gameType.rawValue {
            guard let card = deck.removeOne() else {
                throw GameError.notEnoughCard
            }
            dealer.addCard(card: card)
        }
    }
    
    mutating func resetCards() {
        for playerindex in 0 ..< players.count {
            players[playerindex].resetHands()
        }
        dealer.resetHands()
    }
    
    mutating func startGame() throws {
        deck.shuffle()
        try giveCardsToAllPlayers()
    }
}
