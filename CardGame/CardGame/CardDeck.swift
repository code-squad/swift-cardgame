//
//  CardDeck.swift
//  CardGame
//
//  Created by YOUTH on 2018. 1. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

// 카드 패는 네 가지 모양과 숫자 상수로 고정된 값이므로 enum을 사용했습니다.

class CardDeck {
    enum Suit: String {
        case heart = "♥️"
        case diamond = "♦️"
        case clover = "♣️"
        case spade = "♠️"
    }
    enum Denomination: Int, CustomStringConvertible {
        case one = 1, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen
        
        var description: String {
            switch self {
            case .one: return "A"
            case .eleven: return "J"
            case .twelve: return "Q"
            case .thirteen: return "K"
            default: return String(self.rawValue)
            }
        }
    }
    
}

