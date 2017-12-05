//
//  Shape.swift
//  CardGame
//
//  Created by 심 승민 on 2017. 11. 24..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

// Shape : Spades > Hearts > Diamonds > Clubs
// 선택이유 : 카드의 모양과 숫자는 선택지가 정해져 있으므로 enum 선택.
enum Shape: String, EnumCollection {
    case spades = "♠️"
    case hearts = "♥️"
    case diamonds = "♦️"
    case clubs = "♣️"
}

extension Shape: CustomStringConvertible {
    var description: String {
        return self.rawValue
    }
}

extension Shape: Equatable {
    static func ==(lhs: Shape, rhs: Shape) -> Bool {
        guard lhs.hashValue == rhs.hashValue else { return false }
        return true
    }
}

extension Shape: Comparable {
    static func <(lhs: Shape, rhs: Shape) -> Bool {
        // 해시값이 작을수록 카드패의 가치가 높아짐.
        guard lhs.hashValue > rhs.hashValue else { return false }
        return true
    }

}
