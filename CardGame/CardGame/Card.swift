//
//  Card.swift
//  CardGame
//
//  Created by moon on 2018. 5. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Card {
    
    // Nested enum을 선택한 이유 :
    // - 코드의 가독성을 위해 (Card의 suit, number의 프로퍼티 타입을 한 눈에 확인할 수 있다.)
    // - 현재로써는 Card에서만 사용하는 타입이므로 "Card의 Suit, Card의 Number"를 표현하기 위해
    enum Suit {
        case clubs
        case diamonds
        case hearts
        case spades
    }
    
    enum Number {
        case two, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
    }
    
    let suit: Suit
    let number: Number
    
    init(suit: Suit, number: Number) {
        self.suit = suit
        self.number = number
    }
}
