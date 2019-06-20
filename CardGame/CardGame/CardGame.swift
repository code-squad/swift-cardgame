//
//  CardGame.swift
//  CardGame
//
//  Created by jang gukjin on 20/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGame {
    var deck: CardDeck
    
    /// 카드를 플레이어와 딜러에게 배분하는 함수
    mutating func cardAllocation(cardCount: Int, playerCount: Int) throws -> [[Card]]{
        var playerAndCard = [[Card]]()
        if deck.totalCard.count < cardCount * playerCount+1 {
            throw DrawError.noCard
        }
        for player in 0...playerCount {
            playerAndCard.append([])
            for _ in 0..<cardCount {
                playerAndCard[player].append(try deck.removeOne())
            }
        }
        return playerAndCard
    }
}
