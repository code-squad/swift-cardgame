//
//  GameException.swift
//  CardGame
//
//  Created by 이동영 on 29/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum GameException: LocalizedError {
    case emptyDeck
    
    var errorDescription: String {
        switch self {
        case .emptyDeck:
            return "덱이 비었습니다."
        }
    }
}

