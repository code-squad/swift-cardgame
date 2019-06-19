//
//  CardDeck.swift
//  CardGame
//
//  Created by jang gukjin on 18/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardDeck {
    private (set) var oneCard: Card?
    private (set) var totalCard: [Card] = []
    
    init(){
        self.reset()
    }
    
    /// 카드의 총 수를 카운트하는 함수
    func count() -> Int{
        return totalCard.count
    }
    
    /// 카드를 다시 섞는 함수
    mutating func shuffle(){
        totalCard.shuffle()
    }
    
    /// 카드를 한장 뽑는 함수
    mutating func removeOne() {
        oneCard = totalCard[0]
        totalCard.removeFirst()
        if oneCard != nil {
            oneCard!.printCard()
        }
    }
    
    /// 카드를 초기화 하는 함수
    mutating func reset(){
        totalCard = []
        for suit in CardSuit.allCases {
            for number in CardNumber.allCases {
                totalCard.append(Card(suit: suit, rank: number))
            }
        }
    }
}
