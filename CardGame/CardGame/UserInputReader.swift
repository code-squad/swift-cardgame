//
//  UserInputReader.swift
//  CardGame
//
//  Created by sungchan.you on 2019/09/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Prompt: CustomStringConvertible {
    case readGameType
    case readNumberOfPlayer
    
    var description: String {
        switch self {
        case .readGameType :
            return "카드 게임 종류를 선택하세요.\n1. 7카드\n2. 5카드"
        case .readNumberOfPlayer :
            return "참여할 사람의 인원을 입력하세요."
        }
    }
}

protocol UserInputReadable {
    func read(prompt: Prompt) -> String
}

struct UserInputReader: UserInputReadable {
    func read(prompt: Prompt) -> String {
        print(prompt)
        return readLine() ?? ""
    }
}

