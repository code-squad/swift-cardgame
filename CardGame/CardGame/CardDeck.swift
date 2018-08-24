//
//  CardDeck.swift
//  CardGame
//
//  Created by oingbong on 2018. 8. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

/*
 
 count() 갖고 있는 카드 개수를 반환한다.
 shuffle() 기능은 전체 카드를 랜덤하게 섞는다.
 removeOne() 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
 reset() 처음처럼 모든 카드를 다시 채워넣는다.
 
 1. 카드 초기화 : reset -> count -> print
 2. 카드 섞기 : shuffle -> count -> print
 3. 카드 하나 뽑기 : removeOne -> count -> print
 
*/
struct CardDeck{
    
    static func reset() -> [Card] {
        var cards = [Card]()
        let numbers = CardNumber.allCases
        let shapes = CardShape.allCases
        for number in numbers {
            for shape in shapes {
                let card = Card.init(number: number, shape: shape)
                cards.append(card)
            }
        }
        return cards
    }
    
}
