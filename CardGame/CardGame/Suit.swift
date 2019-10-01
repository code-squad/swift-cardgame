//
//  Suit.swift
//  CardGame
//
//  Created by 공명진 on 2019/09/29.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Suit: Int, CaseIterable {
    case spades, hearts, diamonds, clubs
    func description() -> String {
        switch self {
        case .spades:
            return "♠️"
        case .hearts:
            return "♥️"
        case .diamonds:
            return "♦️"
        case .clubs:
            return "♣️"
        }
    }
}
