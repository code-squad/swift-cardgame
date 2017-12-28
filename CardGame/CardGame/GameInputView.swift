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
        case Cardshortage
    }
    private var gameInfo: GameInfo
    init() {
        self.gameInfo = GameInfo()
    }
    
    func inputKindOfCardGame() throws -> GameInfo {
        print("카드 게임 종류를 선택하세요.\n1. 7카드\n2. 5카드\n> ", terminator: "")
        guard let kindOfGame = Int(readLine()!) else {
            throw CardGameError.InvalidCardGameSelection
        }
        guard kindOfGame > 0 && kindOfGame < 3 else {
            throw CardGameError.InvalidCardGameSelection
        }
        switch kindOfGame {
            case 1: gameInfo.kindOfGame = 7
            case 2: gameInfo.kindOfGame = 5
        default:
            gameInfo.kindOfGame = -1
        }
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
        gameInfo.numberOfPlayer = numberOfPlayer + 1 // player and dealer
    }
    
}
