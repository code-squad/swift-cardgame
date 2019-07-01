//
//  GameInputView.swift
//  CardGame
//
//  Created by Daheen Lee on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct GameInputView {
    static let questionForMenuSelecton = """
                                        카드 게임 종류를 선택하세요.
                                        1. 7카드
                                        2. 5카드
                                        >
                                        """
    static let questionForNumberOfPlayers = """
                                            참여할 사람의 인원을 입력하세요.
                                            >
                                            """
    
    static func read() -> (Menu, Int) {
        print(questionForMenuSelecton)
        let selection = readLine() ?? ""
        let menu = Menu(selection: selection)
        print(questionForNumberOfPlayers)
        let numberOfPlayers = readLine() ?? ""
        let convertedNumber = Int(numberOfPlayers) ?? 0
        return (menu, convertedNumber)
    }
    
}
