//
//  GameInputView.swift
//  CardGame
//
//  Created by Choi Jeong Hoon on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {
    enum Message: CustomStringConvertible {
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
                3. 카드 충전
                4. 게임 종료
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
    
    static func inputMenu () -> CardGameInfo.Menu {
        print(InputView.Message.ofMenu)
        let input = readLine() ?? "0"
        guard let inputNum = Int(input), let menu = CardGameInfo.Menu(rawValue: inputNum) else {
            return CardGameInfo.Menu.PleaseInputAgain
        }
        return menu
    }
    
    static func inputPlayer () -> CardGameInfo.NumberOfParticipantsCases {
        print(InputView.Message.ofCasesOfParticipants)
        let input = readLine() ?? "0"
        guard let inputNum = Int(input), let numberOfParticipants = CardGameInfo.NumberOfParticipantsCases(rawValue: inputNum) else {
            return CardGameInfo.NumberOfParticipantsCases.InValidNumber
        }
        return numberOfParticipants
    }
}
