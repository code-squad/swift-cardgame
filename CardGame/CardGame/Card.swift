//
//  Card.swift
//  CardGame
//
//  Created by BLU on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation
/// 모양과 숫자 타입을 함께 갖는 카드 클래스, 카드의 속성은 외부에서 사용되지 않기에 클래스 내부에 선언
class Card: CustomStringConvertible {
    
    enum Suit: Int, CustomStringConvertible, CaseIterable {
        case hearts, diamonds, clubs, spades
        
        var description: String {
            switch self {
            case .hearts:
                return "\u{2665}"
            case .diamonds:
                return "\u{2666}"
            case .clubs:
                return "\u{2663}"
            case .spades:
                return "\u{2660}"
            }
        }
    }
    
    enum Rank: Int, CustomStringConvertible, CaseIterable {
        case ace = 1
        case two, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king
        
        var description: String {
            switch self {
            case .ace:
                return "A"
            case .jack:
                return "J"
            case .queen:
                return "Q"
            case .king:
                return "K"
            default:
                return "\(self.rawValue)"
            }
        }
    }
    
    var description: String {
        return "\(self.suit)\(self.rank)"
    }
    
    private let suit: Suit
    private let rank: Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
}
