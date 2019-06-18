//
//  CardDeck.swift
//  CardGame
//
//  Created by jang gukjin on 18/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

/*
 모든 종류의 카드 객체 인스턴스를 포함하는 카드덱 구조체를 구현한다.
 객체지향 설계 방식에 맞도록 내부 속성을 모두 감추고 다음 인터페이스만 보이도록 구현한다.
 count() 갖고 있는 카드 개수를 반환한다.
 shuffle() 기능은 전체 카드를 랜덤하게 섞는다.
 removeOne() 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
 reset() 처음처럼 모든 카드를 다시 채워넣는다.
 */
import Foundation

struct CardDeck {
    var oneCard: Card
    var totalCard:[Card] = []
    
    mutating func distinctNumber(of input: String) throws -> Int{
        reset()
        guard let menuNumber:Int = Int(input) else {
            throw ErrorMessage.notInt
        }
        switch menuNumber{
        case 1: reset()
        case 2: shuffle()
        case 3: removeOne()
        default: throw ErrorMessage.outOfRange
        }
        return count()
    }
    
    mutating func count() -> Int{
        return totalCard.count
    }
    
    mutating func shuffle(){
        totalCard.shuffle()
    }
    
    mutating func removeOne() {
        oneCard = totalCard[0]
        totalCard.removeFirst()
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
