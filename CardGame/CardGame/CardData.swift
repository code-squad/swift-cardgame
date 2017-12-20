//
//  CardData.swift
//  CardGame
//
//  Created by Eunjin Kim on 2017. 12. 20..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class CardData {

    
    // Nested enum 타입을 사용한 데이터 구조가 클래스보다 사용하기에 편리할 것 같아서 사용함.
    enum Shape: Character {
        case Spades = "♠", Hearts = "♥", Diamonds = "◆", Clubs = "♣"
        //U+2660, U+2665, U+25C6, U+1F340
    }
    enum Number: Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Ace = 1, Jack = 11, Queen, King
    }
}
