//
//  Shape.swift
//  CardGame
//
//  Created by 윤동민 on 04/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum CardShape : Int, CustomStringConvertible {
    case spade = 1
    case clover = 2
    case diamond = 3
    case heart = 4
    var description: String {
        switch self {
        case .spade:
            return "♠️"
        case .clover:
            return "♣️"
        case .heart:
            return "♥️"
        case .diamond:
            return "♦️"
        }
    }
    
    // Shape의 모든 케이스 리스트
    static var allCases: [CardShape] {
        var cases : [CardShape] = []
        var index = 1
        while let element = CardShape(rawValue: index) {
            cases.append(element)
            index += 1
        }
        return cases
    }
}
