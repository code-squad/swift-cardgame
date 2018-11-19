//
//  GameInputView.swift
//  CardGame
//
//  Created by 윤지영 on 16/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct GameInputView {
    private struct Guide {
        static let start = "카드 게임 종류를 선택하세요."
        static let gameMode = GameMode.allCases
            .map { "\($0.rawValue). \($0.numberOfCards)카드" }
            .joined(separator: "\n")
        static let numberOfPlayers = "참여할 사람의 인원을 입력하세요."
    }

    static private func readNumber(with guide: String) -> Int? {
        print(guide)
        guard let input: String = readLine() else { return nil }
        guard let number: Int = Int(input) else { return nil }
        return number
    }

    static func readGameInfo() throws -> (mode: GameMode, numberOfPlayers: Int) {
        print(Guide.start)
        guard let menuNumber = readNumber(with: Guide.gameMode) else { throw GameInputError.notInt }
        guard let mode = GameMode(rawValue: menuNumber) else { throw GameInputError.notMenuSupported }
        guard let numberOfPlayers = readNumber(with: Guide.numberOfPlayers) else { throw GameInputError.notInt}
        guard numberOfPlayers > 0 else { throw GameInputError.noPlayer }
        guard numberOfPlayers < 5 else { throw GameInputError.tooManyPlayers }
        return (mode, numberOfPlayers)
    }

}
