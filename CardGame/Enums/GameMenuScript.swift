//
//  GameMenuScript.swift
//  CardGame
//
//  Created by hw on 15/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum GameMenuScript: CustomStringConvertible{
    case selectMenu
    case selectGameType
    case selectNumberOfPlayers
    
    var description: String{
        switch self {
        case .selectMenu:
            return "다음 메뉴를 선택해주세요."
        case .selectGameType:
            return "카드 게임 종류를 선택하세요."
        case .selectNumberOfPlayers:
            return "참여할 사람의 인원을 입력하세요"
        }
    }
}
