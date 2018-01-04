//
//  GameInputView.swift
//  CardGame
//
//  Created by yuaming on 2018. 1. 4..
//  Copyright © 2018년 YUAMING. All rights reserved.
//

import Foundation

struct GameInputView {
    static func selectMenus() throws -> PokerGame.Menu {
        let question = """
        카드 게임 종류를 선택하세요.
        1. 7카드
        2. 5카드
        """
        
        print(question)
        
        guard let answer = readLine() else {
            throw GameError.emptyValue
        }
        
        guard let menu = PokerGame.Menu(rawValue: Int(answer) ?? 0) else {
            throw GameError.invalidSelection
        }
        
        return menu
    }
    
    static func selectNumberOfPlayers() throws -> Int {
        let question = "참여할 사람의 인원을 입력하세요."
        
        print(question)
        
        guard let answer = readLine() else {
            throw GameError.emptyValue
        }
        
        guard let playerCount = Int(answer) else {
            throw GameError.noPlayer
        }
        
        return playerCount
    }
}
