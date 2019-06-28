//
//  GameMenu.swift
//  CardGame
//
//  Created by BLU on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum GameMenu: Int, CustomStringConvertible, CaseIterable {
    case initializeCards = 1
    case shuffleCards
    case drawOneCard
    
    var index: Int {
        return rawValue
    }
    
    var description: String {
        switch self {
        case .initializeCards:
            return "카드 초기화"
        case .shuffleCards:
            return "카드 섞기"
        case .drawOneCard:
            return "카드 하나 뽑기"
        }
    }
}
