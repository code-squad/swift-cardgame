//
//  GameError.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 19..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

enum GameError: String, Error {
    case invalidSelection = "잘못된 게임 메뉴입니다. 다시 선택하세요."
    case emptyValue = "입력값이 없습니다."
    case noCard = "선택할 카드가 없습니다."
    case noCardToShuffle = "섞을 카드가 없습니다."
    case notEnoughCard = "카드 개수가 모자랍니다."
}
