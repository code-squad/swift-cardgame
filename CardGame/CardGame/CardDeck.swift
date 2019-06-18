//
//  CardDeck.swift
//  CardGame
//
//  Created by jang gukjin on 18/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardDeck {
    var oneCard: Card?
    var totalCard: [Card] = []
    
    init(){
        self.reset()
    }
    
    mutating func distinctNumber(of input: String) throws -> Int{
        guard let menuNumber:Int = Int(input) else {
            throw ErrorMessage.notInt
        }
        switch menuNumber{
        case 1:
            reset()
            print("카드 전체를 초기화 했습니다.")
        case 2:
            shuffle()
        case 3:
            oneCard = removeOne()
        default: throw ErrorMessage.outOfRange
        }
        return count()
    }
    
    private mutating func count() -> Int{
        return totalCard.count
    }
    
    private mutating func shuffle(){
        totalCard.shuffle()
    }
    
    private mutating func removeOne() -> Card{
        let oneCard = totalCard[0]
        totalCard.removeFirst()
        return oneCard
    }
    
    mutating func reset(){
        totalCard = []
        for suit in CardSuit.allCases {
            for number in CardNumber.allCases {
                totalCard.append(Card(suit: suit, rank: number))
            }
        }
    }
}
