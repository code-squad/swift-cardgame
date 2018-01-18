//
//  InputView.swift
//  CardGame
//
//  Created by Choi Jeong Hoon on 2018. 1. 15..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {
    enum Message: CustomStringConvertible {
        case ofWelcoming
        case ofUnsupportedInput
        var description: String {
            switch self {
            case .ofWelcoming:
                return """
                다음 메뉴를 선택해주세요.
                1. 7카드 게임
                2. 5카드 게임
                3. 게임 종료
                >
                """
            case .ofUnsupportedInput:
                return "메뉴의 번호 중 한가지를 골라주세요."
            }
        }
    }
    
    static func input () -> CardGameInfo.Menu {
        print(InputView.Message.ofWelcoming)
        let input = readLine() ?? "0"
        guard let inputNum = Int(input), let menu = CardGameInfo.Menu(rawValue: inputNum) else {
            return CardGameInfo.Menu.pleaseInputAgain
        }
        return menu
    }
}
