//
//  StringDescription.swift
//  CardGame
//
//  Created by Choi Jeong Hoon on 2018. 3. 5..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

enum PreGameMessage: CustomStringConvertible {
    case ofMenu
    case ofCasesOfParticipants
    case ofUnsupportedInput
    case ofExceedPossibleNumberOfParticipants
    var description: String {
        switch self {
        case .ofMenu:
            return """
            다음 메뉴를 선택해주세요.
            1. 7카드 게임
            2. 5카드 게임
            >
            """
        case .ofCasesOfParticipants:
            return "참가자수를 입력해주세요. (참가가능 : 1명 ~ 4명)"
        case .ofUnsupportedInput:
            return "메뉴의 번호 중 한가지를 골라주세요."
        case .ofExceedPossibleNumberOfParticipants:
            return "참가 가능한 수는 1-4명입니다."
        }
    }
}

enum InGameMessage: CustomStringConvertible{
    case ofResetCard
    case ofInsufficientCard
    case ofSucceedChargingCard
    var description: String {
        switch self {
        case .ofResetCard:
            return "카드가 초기화되었습니다.\n총 52장의 카드가 있습니다."
        case .ofInsufficientCard:
            return "❗️카드수가 부족합니다.❗️, 프로그램이 종료됩니다.."
        case .ofSucceedChargingCard:
            return "카드 52장이 충전되었습니다."
        }
    }
}


