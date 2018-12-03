//
//  Card.swift
//  CardGame
//
//  Created by 조재흥 on 18. 12. 3..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Card {
    //저는 종류를 한정하는 방법중에 enum이 가장 적합한 것같아 enum을 이용했고
    //값 비교를 편하게 하기 위해 rawValue를 Int타입으로 만들었습니다.
    enum Suit : Int {
        case clubs = 1
        case hearts = 2
        case diamonds = 3
        case spades = 4
    }
    
    //Suit와 마찬가지 이유로 enum과 Int타입의 rawValue를 사용했습니다.
    enum Number : Int {
        case A = 1
        case two, three, four, five, six, seven, eight, nine, ten
        case J, Q, K
    }
    
    private let suit : Suit, number : Number
    
    init(suit:Suit, number:Number) {
        self.suit = suit
        self.number = number
    }
}
