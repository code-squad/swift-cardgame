//
//  Menu.swift
//  CardGame
//
//  Created by jang gukjin on 19/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Menu {
    func select(of input: String) throws -> Int{
        var deck = CardDeck()
        guard let menuNumber:Int = Int(input) else {
            throw ErrorMessage.notInt
        }
        switch menuNumber{
        case 1:
            deck.reset()
            print("카드 전체를 초기화 했습니다.")
        case 2:
            deck.shuffle()
        case 3:
            deck.removeOne()
        default: throw ErrorMessage.outOfRange
        }
        return deck.count()
    }
}
