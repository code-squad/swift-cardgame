//
//  OutputView.swift
//  CardGame
//
//  Created by YOUTH on 2018. 1. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class OutputView {

    enum ProgramDescription: CustomStringConvertible {
        case chooseMenu
        case chooseCardStud
        case askNumberOfPlayer
        case emptyInput
        case wrongInput
        case quitGame
        case lackOfCard

        var description: String {
            switch self {
            case .chooseMenu:
                return "다음 메뉴를 선택해주세요.\n 1. 카드 초기화\n 2. 카드 섞기\n 3. 카드 하나 뽑기\n"
            case .chooseCardStud:
                return "카드 게임 종류를 선택하세요.\n 1. 7카드\n 2. 5카드"
            case .askNumberOfPlayer:
                return "참여할 인원 수를 입력하세요."
            case .emptyInput:
                return "=== 번호를 입력하지 않았습니다. 게임 메뉴를 선택해주세요. ===\n"
            case .wrongInput:
                return "=== 잘못 입력하셨습니다. 다시 입력해주세요. ===\n"
            case .quitGame:
                return "=== 게임 종료 ==="
            case .lackOfCard:
                return "카드가 모자랍니다 :( 게임을 종료합니다!"
            }
        }
    }

    func showResult(text: CustomStringConvertible) {
        print(text.description)
    }
}

