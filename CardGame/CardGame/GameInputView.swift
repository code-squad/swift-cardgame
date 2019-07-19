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
        case invalidGameModeNumber
        case invalidNumberOfPlayers
        
        var localizedDescription: String {
            switch self {
            case .invalidGameModeNumber:
                return "유효하지 않은 게임 모드 번호입니다."
            case .invalidNumberOfPlayers:
                return "유효하지 않은 플레이어 인원 수 입니다."
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
    
    static func readGameMode() throws -> GameMode {
        let gameModeList = """
        1. \(GameMode.sevenCardStud)
        2. \(GameMode.fiveCardStud)
        """
        let number = ask(for: .selectGame, content: "\n" + gameModeList)
        switch number {
        case "1":
            return .sevenCardStud
        case "2":
            return .fiveCardStud
        default:
            throw Error.invalidGameModeNumber
        }
    }
    
    static func readNumberOfPlayers() throws -> Personnel {
        let number = ask(for: .enterNumberOfPlayers)
        switch number {
        case "1":
            return .one
        case "2":
            return .two
        case "3":
            return .three
        case "4":
            return .four
        default:
            throw Error.invalidNumberOfPlayers
        }
    }
}
