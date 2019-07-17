//
//  CardGame.swift
//  CardGame
//
//  Created by JH on 17/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGame {
    var cardDeck = CardDeck()
    
    //매개변수 숫자 2개 -> 카드종류(보여줄카드갯수), 반복출력(참여인원+1(딜러까지..))
    mutating func makeCardGame(type: Int, playerCount: Int) -> [[Card]]? {
        let palyer = playerCount + 1
        var cardGame = [[Card]](repeating: [], count: palyer)
        
        for playerNumber in 0 ..< palyer {
            for _ in 0 ..< type {
                guard let card = cardDeck.removeOne() else {
                    return nil
                }
                cardGame[playerNumber].append(card)
                cardDeck.shuffle()
            }
        }
        return cardGame
    }
    
    
    
}
