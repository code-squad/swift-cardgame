//
//  InputView.swift
//  CardGame
//
//  Created by 윤동민 on 04/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct GameInputView {
    // 메뉴를 입력받음
    static func inputMenu(message: String) -> String {
        print(message)
        print("1. 7카드")
        print("2. 5카드")
        print("> ", terminator: "")
        return inputUser()
    }
    
    // 플레이어 인원을 입력받음
    static func inputPlayer(message: String) -> Int {
        print(message)
        print("> ", terminator: "")
        return Int(inputUser()) ?? 0
    }
    
    // 입력을 받음
    static private func inputUser() -> String {
        return readLine() ?? ""
    }
}
