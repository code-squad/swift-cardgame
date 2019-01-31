//
//  GameInputView.swift
//  CardGame
//
//  Created by Elena on 28/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct GameInputView {
    
    // 카드게임 종류 선택하는것
    private static func getGameStart() -> Int? {
        let gameMode = GameMode.allCases.map { "\($0.rawValue). \($0.modeCardNumber)카드" }.joined(separator: "\n")
        guard let cardGameStart = Int(InputView.readInput(ment: "카드 게임 종류를 선택하세요.",menu: gameMode)) else { return nil}
        return cardGameStart
    }
    
    // 몇명이 할것인지
    private static func getCardGameNumber() -> Int? {
        guard let players = Int(InputView.readInput(ment: "참여할 사람의 인원을 입력하세요.",menu: "최소 1명 ~ 최대 4명까지 가능합니다.")) else { return nil }
        return players
    }
    
    // 입력받은거 예외처리하고 반환(게임모드,참가자)
    // 상위모듈이 처리할수 있도록 Error 던지게 구조를 잡았습니다.
    static func readCardGameInfo() throws -> (mode: GameMode, numberPlayer: Int) {
        
        guard let numberGameMode = GameInputView.getGameStart() else { throw GameInputError.notInt }
        guard let mode = GameMode(rawValue: numberGameMode) else { throw GameInputError.notMenuGame }
        
        guard let numberPlayer = GameInputView.getCardGameNumber() else { throw GameInputError.notInt}
        guard numberPlayer > 0 else { throw GameInputError.noPeople }
        guard numberPlayer < 5 else { throw GameInputError.manyPeople }
        
        return (mode, numberPlayer)
    }
    
}
