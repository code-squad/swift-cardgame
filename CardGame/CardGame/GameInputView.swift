//
//  GameInputView.swift
//  CardGame
//
//  Created by Eunjin Kim on 2017. 12. 27..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class GameInputView {
    enum CardGameError: Error {
        case InvalidCardGameSelection
        case InvalidNumberOfPlayer
    }
    private var gameInfo: GameInfo
    
    init() {
        self.gameInfo = GameInfo()
    }
    func inputKindOfCardGame() throws -> GameInfo {
        print("카드 게임 종류를 선택하세요.\n1. 7카드\n2. 5카드\n> ", terminator: "")
        guard let menuNumber = Int(readLine()!) else {
            throw CardGameError.InvalidCardGameSelection
        }
        guard menuNumber > 0 && menuNumber < 3 else {
            throw CardGameError.InvalidCardGameSelection
        }
        gameInfo.menuNumber = menuNumber
        try inputNumberOfPlayer()
        return gameInfo
    }
    
    func inputNumberOfPlayer() throws {
        print("참여할 사람의 인원을 입력하세요.\n> ", terminator: "")
        guard let numberOfPlayer = Int(readLine()!) else {
            throw CardGameError.InvalidNumberOfPlayer
        }
        guard numberOfPlayer > 0 && numberOfPlayer < 5 else {
            throw CardGameError.InvalidNumberOfPlayer
        }
        gameInfo.numberOfPlayer = numberOfPlayer
    }
}
