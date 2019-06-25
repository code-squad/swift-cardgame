//
//  CardGame.swift
//  CardGame
//
//  Created by jang gukjin on 20/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGame {
    private(set) var cardDeck: CardDeck
    
    /// 카드를 플레이어와 딜러에게 배분하는 함수
    mutating func cardAllocation(cardCount: Int, playerCount: Int) throws -> [Player]{
        var players = [Player]()
        if cardDeck.count() < cardCount * playerCount+1 {
            throw DrawError.noCard
        }
        for index in 0...playerCount {
            players.append(try giveCardToOnePlayer(cardCount: cardCount, playerCount: playerCount, currentIndex: index))
        }
        return players
    }
    
    mutating func giveCardToOnePlayer(cardCount: Int, playerCount: Int, currentIndex: Int) throws -> Player {
        var player: Player
        let playerDeck = try cardDeck.giveCard(count: cardCount)
        let cards = CardSet(cards: playerDeck)
        if currentIndex == playerCount {
            player = Dealer(cards: cards)
        } else {
            player = Participant(name: "참가자#\(currentIndex+1)", cards: cards)
        }
        return player
    }
}
