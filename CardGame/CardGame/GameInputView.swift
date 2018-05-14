//
//  GameInputView.swift
//  CardGame
//
//  Created by moon on 2018. 5. 14..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

enum Question: String {
    case selectMode = "카드 게임 종류를 선택하세요.\n1. 7카드\n2. 5카드\n"
}

struct GameInputView {
    enum Error: Swift.Error {
        case invalidMode
        
        var errorMessage: String {
            switch self {
            case .invalidMode:
                return "유효하지 않는 모드를 입력하셨습니다."
            }
        }
    }
    
    enum Mode: String {
        case sevenCardStudMode = "1"
        case fiveCardStudMode = "2"
    }
    
    static func readGameMode(askMessage: Question) throws -> Mode {
        print(askMessage.rawValue, terminator: "> ")
        guard let modeInput = readLine() else {
            throw self.Error.invalidMode
        }
        guard let mode = Mode(rawValue: modeInput) else {
            throw self.Error.invalidMode
        }
        return mode
    }
}
