//
//  Menu.swift
//  CardGame
//
//  Created by jang gukjin on 19/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Menu {
    private (set) var deck: CardDeck
    private (set) var endGame: Bool
    
    init(deck: CardDeck){
        self.deck = deck
        self.endGame = false
    }
    
    /// 입력된 숫자를 판단하여 해당 메뉴의 기능을 동작하는 함수
    mutating func select(of input: String) throws -> (cardCount: Int, ment: String){
        var ment: String = ""
        guard let menuNumber:Int = Int(input) else {
            throw ErrorMessage.notInt
        }
        switch menuNumber{
        case 0:
            endGame = true
        case 1:
            deck.reset()
            ment = "카드 전체를 초기화 했습니다."
        case 2:
            deck.shuffle()
        case 3:
            ment = deck.removeOne()
        default: throw ErrorMessage.outOfRange
        }
        return (cardCount: deck.count(), ment: ment)
    }
}
