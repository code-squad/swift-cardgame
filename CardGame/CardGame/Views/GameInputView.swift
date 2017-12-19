//
//  GameInputView.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 19..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct GameInputView {
    func selectMenus() throws -> CardGame.Action {
        let question = """
        카드 게임 종류를 선택하세요.
        1. 7카드
        2. 5카드
        """
        
        print(question)
        
        guard let answer = readLine() else {
            throw GameError.emptyValue
        }
        
        
        guard let action = CardGame.Action(rawValue: Int(answer) ?? 0) else {
            throw GameError.invalidSelection
        }
        
        return action
    }
    
    func selectNumberOfPlayers() throws -> String {
        let question = "참여할 사람의 인원을 입력하세요."
        
        print(question)
        
        guard let answer = readLine() else {
            throw GameError.emptyValue
        }
        
        return answer
    }
}
