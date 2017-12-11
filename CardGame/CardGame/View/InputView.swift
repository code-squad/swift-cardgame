//
//  InputView.swift
//  CardGame
//
//  Created by 심 승민 on 2017. 11. 28..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct InputView {
    // 입력 에러 종류.
    enum Error: String, Swift.Error, CustomStringConvertible {
        case invalidMenuNumber = "다시 입력해 주세요."
        case outOfParticipantRange = "참여 인원을 다시 입력해 주세요."
        var description: String {
            var errorMessage: String = ""
            switch self {
            case .invalidMenuNumber: errorMessage = "다시 입력해 주세요."
            case .outOfParticipantRange: errorMessage = "참여 인원을 다시 입력해 주세요."
            }
            return errorMessage
        }
    }
    // 메뉴 종류.
    enum Message: String {
        case menuStud = """
                        카드 게임 종류를 선택하세요.
                        1. 7카드
                        2. 5카드
                        >
                        """
        case menuParticipants = "참여할 사람의 인원을 입력하세요.\n> "
        case menuBase = """
                        다음 메뉴를 선택해주세요.
                        1. 카드 초기화
                        2. 카드 섞기
                        3. 카드 하나 뽑기
                        >
                        """
        case tryAgain = "다시 도전하시겠습니까? (y/n)"
    }

    // 재시도 여부 확인.
    func tryAgain() -> Bool {
        guard let userInput = askFor(message: Message.tryAgain.rawValue) else { return false }
        if userInput == "y" || userInput == "yes" {
            return true
        }else {
            return false
        }
    }

    // 기본 사용자 입력 함수.
    func askFor(message: String) -> String? {
        // 요구 메시지 출력.
        print("\(message)", terminator: " ")
        // q 또는 quit 입력 시 종료.
        guard let inputLine = readLine(), inputLine != "q" && inputLine != "quit" else { return nil }
        return inputLine
    }

    // 사용자 입력 Stud 반환.
    func askForStud() throws -> StudPokerGame.Stud? {
        guard let userInput = askFor(message: Message.menuStud.rawValue) else { return nil }
        guard let inputMenu = Int(userInput) else { throw Error.invalidMenuNumber }
        switch inputMenu {
        case 1: return StudPokerGame.Stud.sevenCard
        case 2: return StudPokerGame.Stud.fiveCard
        default: throw Error.invalidMenuNumber
        }
    }

    // 사용자 입력 플레이어 수 반환.
    func askForParticipants() throws -> Int? {
        guard let userInput = askFor(message: Message.menuParticipants.rawValue) else { return nil }
        guard let numberOfPeople = Int(userInput) else { throw Error.invalidMenuNumber }
        guard numberOfPeople <= StudPokerGame.participantMaximum && numberOfPeople >= StudPokerGame.participantMinimum else { throw Error.outOfParticipantRange }
        return numberOfPeople
    }

}
