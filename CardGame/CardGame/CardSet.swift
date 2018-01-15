//
//  CardSet.swift
//  CardGame
//
//  Created by Choi Jeong Hoon on 2018. 1. 15..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation


// 카드 정보를 갖는 클래스, 특정숫자는 영문자로 표현하기 위해 enum안에 함수 사용
class CardSet {
    enum Suit: String {
        case spade = "♠️", heart = "💖", diamond = "🔶", club = "♣️"
    }
    
    enum Rank: Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Eleven, Twelve, Thirteen
        
        func convertIntToString () -> String {
            switch self {
            case .Eleven : return "J"
            case .Twelve : return "Q"
            case .Thirteen : return "K"
            default:
                return String(self.rawValue)
            }
        }
    }
}
