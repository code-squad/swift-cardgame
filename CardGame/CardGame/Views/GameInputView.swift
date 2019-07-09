//
//  GameInputView.swift
//  CardGame
//
//  Created by JieunKim on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct GameInputView {
    static let questionForMenu = """
    카드 게임 종류를 선택하세요.
    1. 7카드
    2. 5카드
    >
    """
    
    static let questionForParticipant = """
    참여할 사람의 인원을 입력하세요.
    >
    """
    
    static func askForMenu() {
        print(questionForMenu, terminator: "")
    }
    
    static func askForParticipant() {
        print(questionForParticipant, terminator: "")
    }
    
    
}
