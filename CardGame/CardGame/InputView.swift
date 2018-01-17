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
                1. 카드 초기화
                2. 카드 섞기
                3. 카드 하나 뽑기
                4. 프로그램 종료
                >
                """
            case .ofUnsupportedInput:
                return "메뉴의 번호 중 한가지를 골라주세요."
            }
        }
    }
    
    static func input () -> CardGameInfo.Menu {
        print(InputView.Message.ofWelcoming)
        var menu: CardGameInfo.Menu = .end
        let input = readLine() ?? "0"
        if let inputNum = Int(input) {
            if let tempMenu = CardGameInfo.Menu(rawValue: inputNum) {
                menu = tempMenu
            } else {
                return CardGameInfo.Menu.pleaseInputAgain
            }
        } else {
            return CardGameInfo.Menu.pleaseInputAgain
        }
        return menu
    }
}
