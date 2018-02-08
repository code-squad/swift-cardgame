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
    
    static func sevenOrFiveGame () -> KindOfGame? {
        print(InputView.Message.ofMenu, terminator: " ")
        let input = readLine() ?? "0"
        guard let inputNum = Int(input), let menu = Menu(rawValue: inputNum) else { return nil }
        return convertMenuNumToKindofCard(menuNum: menu)
    }
    
    static func numberOfParticipants () -> NumberOfParticipants? {
        print(InputView.Message.ofCasesOfParticipants, terminator: " ")
        let input = readLine() ?? "0"
        guard let inputNum = Int(input), let numberOfParticipants = NumberOfParticipants(rawValue: inputNum) else { return nil }
        return numberOfParticipants
    }
    
    private static func convertMenuNumToKindofCard (menuNum: Menu) -> KindOfGame {
        return menuNum.rawValue == 1 ? .sevenCard : .fiveCard
    }
}
