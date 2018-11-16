//
//  GameError.swift
//  CardGame
//
//  Created by 윤지영 on 16/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum GameError: Error, GameErrorMessage {
    case noPlayer
    case noCard

    var message: String {
        switch self {
        case .noPlayer:
            return "플레이어가 없어 게임을 진행할 수 없습니다."
        case .noCard:
            return "다음 게임을 진행하기에 카드가 부족합니다."
        }
    }
}

protocol GameErrorMessage {
    var message: String { get }
}
