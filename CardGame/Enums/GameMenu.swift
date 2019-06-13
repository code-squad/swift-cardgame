//
//  GameMenu.swift
//  CardGame
//
//  Created by hw on 13/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum GameMenu : CustomStringConvertible{
    
    case initialization
    case shuffle
    case drawOne
    var description: String {
        switch self {
        case .initialization:
            return "1. 카드 초기화"
        case .shuffle:
            return "2. 카드 섞기"
        case .drawOne:
            return "3. 카드 하나 뽑기"
        }
    }
}
