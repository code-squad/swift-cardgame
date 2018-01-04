//
//  GameError.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 28..
//  Copyright © 2017년 YUAMING. All rights reserved.
//

import Foundation

enum GameError: Error {
    case notEnoughCards
    case emptyValue
    case invalidSelection
    case noPlayer
    
    var localizedDescription: String {
        switch self {
        case .notEnoughCards:
            return "카드 수가 충분하지 않습니다."
        case .emptyValue:
            return "입력 값이 없습니다."
        case .invalidSelection:
            return "게임 메뉴가 없습니다. 다시 선택하세요."
        case .noPlayer:
            return "게임 할 플레이어가 없습니다."
        }
    }
}
