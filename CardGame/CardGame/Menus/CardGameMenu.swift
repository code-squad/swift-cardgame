//
//  CardGameMenu.swift
//  CardGame
//
//  Created by JieunKim on 06/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

// DeckMenu
import Foundation

enum GameMenu: String, CustomStringConvertible {
    case reset = "1"
    case shuffle = "2"
    case draw = "3"
    
    var description: String {
        switch self {
        case .reset:
            return "\(rawValue). 카드 초기화"
        case .shuffle:
            return "\(rawValue). 카드 섞기"
        case .draw:
            return "\(rawValue). 카드 하나 뽑기"
        }
    }
}
