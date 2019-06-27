//
//  Card.swift
//  CardGame
//
//  Created by BLU on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation
/// 모양과 숫자 타입을 함께 갖는 카드 클래스, 카드의 속성은 외부에서 사용되지 않기에 클래스 내부에 선언
class Card {
    
    enum Suit: CustomStringConvertible {
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
    
    enum Rank: Int {
        case A = 1, two, three, four, five, six, seven, eight, nine, ten, J, Q, K
    }

    private let suit: Suit
    private let rank: Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
}
