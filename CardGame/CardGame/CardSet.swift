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
    enum Suit: String, CustomStringConvertible {
        case spade = "♠️", heart = "💖", diamond = "🔶", club = "♣️"
        static let TotalSuit = [spade, heart, diamond, club]
        var description: String {
            switch self {
            default: return rawValue
            }
        }
    }
    
    enum Rank: Int {
        case one = 1, two, three, four, five, six, seven, eight, nine, ten
        case eleven, twelve, thirteen
        static let TotalRank = Rank.one.rawValue ... Rank.thirteen.rawValue
        var description: String {
            switch self {
            case .one : return "A"
            case .eleven : return "J"
            case .twelve : return "Q"
            case .thirteen : return "K"
            default: return String(self.rawValue)
            }
        }
    }
}
