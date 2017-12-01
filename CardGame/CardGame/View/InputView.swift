//
//  InputView.swift
//  CardGame
//
//  Created by 심 승민 on 2017. 11. 28..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct InputView {
    enum InputError: String, Error {
        case invalidMenuNumber = "잘못된 메뉴입니다. 다시 선택해 주세요."
        case outOfParticipantRange = "참여 인원을 다시 입력해 주세요."
    }
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
    }

    func askFor(message: String) throws -> String? {
        // 요구 메시지 출력.
        print("\(message)", terminator: " ")
        // q 또는 quit 입력 시 종료.
        guard let inputLine = readLine(), inputLine != "q" && inputLine != "quit" else { return nil }
        return inputLine
    }

    func askForStud() throws -> Dealer.Stud? {
        guard let userInput =  try askFor(message: Message.menuStud.rawValue) else { return nil }
        guard let inputMenu = Int(userInput) else { throw InputError.invalidMenuNumber }
        switch inputMenu {
        case 1: return Dealer.Stud.sevenCard
        case 2: return Dealer.Stud.fiveCard
        default: throw InputError.invalidMenuNumber
        }
    }

    func askForParticipants() throws -> Int? {
        guard let userInput =  try askFor(message: Message.menuParticipants.rawValue) else { return nil }
        guard let numberOfPeople = Int(userInput) else { throw InputError.invalidMenuNumber }
        guard numberOfPeople <= Dealer.participantMaximum && numberOfPeople >= Dealer.participantMinimum else { throw InputError.outOfParticipantRange }
        return numberOfPeople
    }

    func handleMenus() throws -> Dealer.GameMenu? {
        guard let userInput =  try askFor(message: Message.menuBase.rawValue) else { return nil }
        // 입력값이 숫자가 아니거나 1~3번을 제외한 수인 경우, 에러 전달.
        guard let menuNumber = Int(userInput), menuNumber == 1 || menuNumber == 2 || menuNumber == 3 else { throw InputError.invalidMenuNumber }
        return Dealer.GameMenu(rawValue: menuNumber)
    }
    
}
