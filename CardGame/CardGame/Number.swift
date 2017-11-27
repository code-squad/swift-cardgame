//
//  Number.swift
//  CardGame
//
//  Created by 심 승민 on 2017. 11. 24..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

// Number : King(13), Queen(12), Jack(11), 10 ~ 2, Ace(1) 중 하나
// 선택이유 : 카드의 모양과 숫자는 선택지가 정해져 있으므로 enum 선택.
enum Number: Int {
    case king = 13
    case queen
    case jack
    case ten, nine, eight, seven, six, five, four, three, two
    case ace
}

extension Number: CustomStringConvertible {
    var description: String {
        switch self {
        case .king: return "K"
        case .queen: return "Q"
        case .jack: return "J"
        case .ace: return "A"
        default: return String(self.rawValue)
        }
    }

}
