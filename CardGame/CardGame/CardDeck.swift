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
    mutating func removeOne() throws -> Card{
        guard let oneCard: Card = totalCard.popLast() else {
            throw DrawError.noCard
        }
        return oneCard
    }
    
    /// 카드를 초기화 하는 함수
    mutating func reset(){
        noCard()
        for suit in CardSuit.allCases {
            for number in CardNumber.allCases {
                totalCard.append(Card(suit: suit, rank: number))
            }
        }
    }
    
    /// 카드를 0장으로 만드는 함수
    mutating func noCard() {
        totalCard = []
    }
    
    /// 카드를 배분하는 함수
    mutating func giveCard(count: Int) throws -> [Card]{
        var cards = [Card]()
        for _ in 0..<count {
            cards.append(try removeOne())
        }
        return cards
    }
}
