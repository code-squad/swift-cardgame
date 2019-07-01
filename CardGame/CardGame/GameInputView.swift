//
//  GameInputView.swift
//  CardGame
//
//  Created by BLU on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct GameInputView {
    
    enum Error: Swift.Error {
        case invalidMenuNumber
        case notNumber
        
        var localizedDescription: String {
            switch self {
            case .invalidMenuNumber:
                return "유효하지 않은 메뉴 번호입니다."
            case .notNumber:
                return "숫자가 아닙니다."
            }
        }
    }
    
    enum Menu: CustomStringConvertible {
        case selectGame
        case enterNumberOfPlayers
        
        var description: String {
            switch self {
            case .selectGame:
                return "카드 게임 종류를 선택하세요."
            case .enterNumberOfPlayers:
                return "참여할 사람의 인원을 입력하세요."
            }
        }
    }
    
    static private func ask(for menu: Menu) -> String {
        print(menu)
        return readLine() ?? ""
    }
    
    static func readGameOption() throws -> GameOption? {
        let number = ask(for: .selectGame)
        if let option = GameOption(rawValue: number) {
            return option
        }
        throw Error.invalidMenuNumber
    }
    
    static func readNumberOfPlayers() throws -> Int {
        let number = ask(for: .enterNumberOfPlayers)
        if let number = Int(number) {
            return number
        }
        throw Error.notNumber
    }
}
