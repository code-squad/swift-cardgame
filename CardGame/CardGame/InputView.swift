//
//  InputView.swift
//  CardGame
//
//  Created by Choi Jeong Hoon on 2018. 1. 15..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {
    enum InputMessage: CustomStringConvertible {
        case welcoming
        case invalindNum
        var description: String {
            switch self {
            case .welcoming:
                return """
                    다음 메뉴를 선택해주세요.
                    1. 카드 초기화
                    2. 카드 섞기
                    3. 카드 하나 뽑기
                    4. 프로그램 종료
                    >
                    """
            case .invalindNum:
                return "메뉴의 번호 중 한가지를 골라주세요."
            }
        }
    }
    
    static func input () -> CardGameInfo.Menu? {
        var pickedNum = 0
        var menu: CardGameInfo.Menu
        let input = readLine() ?? "0"
        if let inputNum = Int(input) {
            if inputNum < 0 || inputNum > 4 {
                print (InputMessage.invalindNum, terminator: " ")
                return nil
            } else {
                pickedNum = inputNum
            }
        } else {
            print (InputMessage.invalindNum, terminator: " ")
            return nil
        }
       
        if let tempMenu = CardGameInfo.Menu(rawValue: pickedNum) {
            menu = tempMenu
        } else {
            print (InputMessage.invalindNum, terminator: " ")
            return nil
        }
        return menu
    }
}

