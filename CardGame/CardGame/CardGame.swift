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
    /// 입력받은 수를 판단해서 어떤 게임을 시작할지 결정하고 카드의 수를 반환하는 함수
    mutating func selectGame(of input: String) throws -> Int {
        var countOfCard: Int
        guard let menuNumber:Int = Int(input) else {
            throw ErrorMessage.notInt
        }
        switch menuNumber{
        case 1:
            countOfCard = 7
        case 2:
            countOfCard = 5
        default: throw ErrorMessage.outOfRange
        }
        return countOfCard
    }
    
    /// 입력받은 수를 판단해서 플레이어가 몇명인지 판단하는 함수
    mutating func distinctPlayerNumber(of input: String) throws -> Int {
        guard let countOfPlayer:Int = Int(input) else {
            throw ErrorMessage.notInt
        }
        if countOfPlayer > 4 || countOfPlayer < 0 {
            throw ErrorMessage.overNumber
        } else {
            return countOfPlayer
        }
    }
    
    mutating func cardAllocation(cardCount: Int, playerCount: Int) -> [[Card]]{
        var playerAndCard = [[Card]]()
        for player in 0...playerCount {
            playerAndCard.append([])
            for _ in 0..<cardCount {
                playerAndCard[player].append(deck.removeOne())
            }
        }
        return playerAndCard
    }
}
