//
//  GameInputView.swift
//  CardGame
//
//  Created by 이진영 on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct GameInputView {
    private static let menuMent = "\(GameMenu.exit)\n\(GameMenu.sevenCardStud)\n\(GameMenu.fiveCardStud)"
    private static let playerCountMent = "참여할 사람의 인원을 입력하세요."
    
    static func readGameMenu() -> Int {
        let selection = InputView.readInput(ment: menuMent)
        
        return Int(selection) ?? 0
    }
    
    static func readNumberOfPlayer() -> Int {
        let numberOfPlayer = InputView.readInput(ment: playerCountMent)
        
        return Int(numberOfPlayer) ?? 0
    }
}
