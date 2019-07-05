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
        case notAllowedRange
        case notNumber
        
        var localizedDescription: String {
            switch self {
            case .invalidMenuNumber:
                return "유효하지 않은 메뉴 번호입니다."
            case .notAllowedRange:
                return "허용 범위가 아닙니다."
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
    
    static private func ask(for menu: Menu, content: String = "") -> String {
        print("\(menu)\(content)")
        print("> ", terminator: "")
        return readLine() ?? ""
    }
    
    static func readGameOption() throws -> GameOption {
        let optionList = GameOption.allCases
            .map({ "\($0)" })
            .joined(separator: "\n")
        let number = ask(for: .selectGame, content: "\n" + optionList)
        if let option = GameOption(rawValue: number) {
            return option
        }
        throw Error.invalidMenuNumber
    }
    
    static func readNumberOfPlayers(checkRange: (String) -> Bool) throws -> Int {
        let number = ask(for: .enterNumberOfPlayers)
        guard checkRange(number) else {
            throw Error.notAllowedRange
        }
        if let number = Int(number) {
            return number
        }
        throw Error.notNumber
    }
}
