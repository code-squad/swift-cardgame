//
//  GameInputView.swift
//  CardGame
//
//  Created by 이동영 on 29/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct GameInputView {
    
    static func getMode() throws -> Int {
        return try ask(.mode)
    }
    
    static func getEntry() throws -> Int {
        return try ask(.entry)
    }
    
    private static func ask(_ question:Question) throws -> Int {
        OutputView.output(question)
        guard let input = InputView.getNumber() else {
            throw InputException.wrongFormat
        }
        return input
    }
}
// - MARK: - + Question
extension GameInputView {
    enum Question: CustomStringConvertible {
        case mode
        case entry
        
        var description: String {
            switch self {
            case .mode:
                return """
                카드 게임 종류를 선택하세요.
                1. 7카드
                2. 5카드
                """
            case .entry:
                return "참여할 사람의 인원을 입력하세요."
            }
            
        }
    }
}
