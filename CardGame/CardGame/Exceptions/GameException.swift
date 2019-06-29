//
//  GameException.swift
//  CardGame
//
//  Created by 이동영 on 29/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum GameException: LocalizedError {
    case initFailure
    case emptyDeck
    
    var errorDescription: String? {
        switch self {
        case .initFailure:
            return "게임 초기화에 실패했습니다."
        case .emptyDeck:
            return "덱이 비었습니다."
        }
    }
}

