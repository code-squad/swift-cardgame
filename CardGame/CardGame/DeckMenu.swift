//
//  DeckMenu.swift
//  CardGame
//
//  Created by CHOMINJI on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum DeckMenu: Int, CustomStringConvertible, CaseIterable {
    case reset = 1
    case shuffle
    case draw
    
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
