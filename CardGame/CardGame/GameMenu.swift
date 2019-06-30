//
//  GameMenu.swift
//  CardGame
//
//  Created by BLU on 30/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum GameMenu: String, CustomStringConvertible {
    case initialize = "1"
    case shuffle = "2"
    case draw = "3"
    
    var description: String {
        switch self {
        case .initialize:
            return "\(rawValue). 카드 초기화"
        case .shuffle:
            return "\(rawValue). 카드 섞기"
        case .draw:
            return "\(rawValue). 카드 하나 뽑기"
        }
    }
}
