//
//  GameInputError.swift
//  CardGame
//
//  Created by 윤지영 on 16/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum GameInputError: String, Error {
    case notInt = "숫자로 입력해주세요."
    case notMenuSupported = "메뉴 내에서 골라주세요"
    case noPlayer = "1명 이상의 플레이어가 필요합니다."
    case tooManyPlayer = "최대 4명까지 플레이가 가능합니다."
}
