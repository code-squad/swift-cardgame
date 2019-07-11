//
//  GameInputView.swift
//  CardGame
//
//  Created by JieunKim on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct GameInputView {
    private static let questionForMenu = """
    카드 게임 종류를 선택하세요.
    1. 7카드
    2. 5카드
    >
    """
    
    private static let questionForParticipant = """
    참여할 사람의 인원을 입력하세요.
    >
    """
    
    private static func askForMenu() {
        print(questionForMenu, terminator: "")
    }
    
    private static func askForParticipant() {
        print(questionForParticipant, terminator: "")
    }
    
    static func readModeSelection() -> CardGameMode? {
        askForMenu()
        let selection = readLine() ?? ""
        return CardGameMode(selectMode: selection)
    }
    
    static func readNumberOfParticipants() -> CardGameParticipant? {
        askForParticipant()
        let numberOfParticipants = readLine() ?? ""
        return CardGameParticipant(selectNumber: numberOfParticipants)
    }
    
    enum Error: Swift.Error {
        case invalidMenuNumber
        
        var localizedDescription: String {
            switch self {
            case .invalidMenuNumber:
                return "유효하지 않은 메뉴 번호입니다."
            }
        }
    }
}
