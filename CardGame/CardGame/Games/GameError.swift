//
//  GameError.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 19..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

enum GameError: Error {
    case invalidSelection
    case emptyValue
    case noCard
    case noCardToShuffle
    case notEnoughCard
    
    var localizedDescription: String {
        switch self {
        case .emptyValue:
            return "입력값이 없브니다."
        case .invalidSelection:
            return "잘못된 게임 메뉴입니다. 다시 선택하세요."
        case .noCard:
            return "선택할 카드가 없습니다."
        case .noCardToShuffle:
            return "섞을 카드가 없습니다."
        case .notEnoughCard:
            return "카드 개수가 모자랍니다."
        }
    }
}
