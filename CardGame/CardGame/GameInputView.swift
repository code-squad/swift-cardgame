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
    
    
    
    static func askForMenuSelection() {
        print(questionForMenuSelecton, terminator: "")
    }
    
    static func askForNumberOfParticipants() {
        print(questionForNumberOfPlayers, terminator: "")
    }
    
    static func readMenuSelection() -> Menu? {
        let selection = readLine() ?? ""
        return Menu(selection: selection)
    }
    
    static func readNumberOfParticipants() -> Int? {
        let numberOfParticipants = readLine() ?? ""
        return Int(numberOfParticipants)
    }
}
