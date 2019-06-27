//
//  Card.swift
//  CardGame
//
//  Created by 이동영 on 25/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Card {
    private let suit: Suit
    private let rank: Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    init?(suit: Character, rank: Int) {
        guard let suit = Suit(rawValue: suit), let rank = Rank(rawValue: rank) else {
            return nil
        }
        self.suit = suit
        self.rank = rank
    }
    
}
// - MARK: - Nested Enum (Suit, Rank)
extension Card {
    enum Suit: Character, CustomStringConvertible, CaseIterable {
        case spades = "♠️"
        case hearts = "♥️"
        case diamonds = "♦️"
        case clubs = "♣️"
        
        var description: String {
            return "\(rawValue)"
        }
        
    }
    
    enum Rank: Int, CustomStringConvertible, CaseIterable {
        case ace = 1
        case two,three,four,five,six,seven,eight,nine,ten
        case jack,queen,king
        
        var description: String {
            switch self {
            case .ace:
                return "A"
            case .two,.three,.four,.five,.six,.seven,.eight,.nine,.ten:
                return "\(rawValue)"
            case .jack:
                return "J"
            case .queen:
                return "Q"
            case .king:
                return "K"
            }
        }
    }
}

// - MARK: - + CustomStringConvertible
extension Card: CustomStringConvertible {
    var description: String {
        return "\(self.suit)\(self.rank)"
    }
}

// - MARK: - + Equatable
extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        let sameSuit = lhs.suit == rhs.suit
        let sameRank = lhs.rank == rhs.rank
        return sameSuit && sameRank
    }
}
/*==============================================================================
 
 ------------------------------- enum ------------------------------------------
 공통된 형을 안전하게 다루며, 다형성을 통한 확장에서는 프로토콜이 더 좋은 선택지 일 수 있으나
 타입의 추가가 빈번하게 발생하지 않을거라고 생각하여 선택하게 됬습니다.
 
 ------------------------------ 중첩타입 ------------------------------------------
 특정타입을 지원하기위한 목적에서 사용된다고 하고, 별도로 다른 목적으로는 사용되지 않는 타입일 경우
 특정 타입내에 위치시킴으로서 좀 더 의도를 표현할 수 있다고 생각했습니다.
 
 생성자에서 노출되는 것이 조금 걸리지만 카드와 밀접하게 연관된 타입이라고 하고싶었습니다.
 
 =================================================================================*/
