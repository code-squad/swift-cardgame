//
//  InputView.swift
//  CardGame
//
//  Created by moon on 2018. 5. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

enum Question: String {
    case menu = "다음 메뉴를 선택해주세요. \n1. 카드초기화\n2. 카드 섞기\n3. 카드 하나 뽑기\n>"
}

enum Menu: String {
    enum Error: Swift.Error {
        case invalidMenu
        
        var errorMessage: String {
            switch self {
            case .invalidMenu:
                return "메뉴 선택이 잘못되었습니다."
            }
        }
    }
    
    case resetCard = "1"
    case shuffleCard = "2"
    case removeOneCard = "3"
}

struct InputView {
    static private func readInput(question: Question) -> String {
        print(question.rawValue, terminator: " ")
        guard let input = readLine() else {
            fatalError("Nil Input")
        }
        return input
    }
    
    static func selectMenu() throws -> Menu {
        let input: String = InputView.readInput(question: Question.menu)
        guard let menu = Menu(rawValue: input) else {
            throw Menu.Error.invalidMenu
        }
        return menu
    }
}
