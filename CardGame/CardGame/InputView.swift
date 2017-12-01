//
//  InputView.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 27..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

struct InputView {

    enum InputGuide: String, Error {
        case menu =
        """
        다음 메뉴를 선택해주세요.
        1. 카드 초기화
        2. 카드 섞기
        3. 카드 하나 뽑기
        4. 카드팩 추출하기
        5. 포커 게임 시작
        0. 종료
        """
        case invalidInput = "입력값에 이상이 있습니다."
        case wrongPackCount = "1부터 9 사이의 수를 골라주세요."
        case invalidCardAction = "CardAction에 없는 동작입니다."
        case wrongNum = "보기의 번호 중에 숫자 한 개를 골라주세요."
        case cardPackCountGuide = "원하는 카드 팩의 갯수를 선택하세요.(1~9)"
    }

    func readInput() throws -> DealerAction.CardAction {
        let inputValue: String = readLine() ?? "0"
        let selectedNum: Int = try getIntValue(inputValue: inputValue, min: 0, max: 5, message: InputGuide.wrongNum)
        guard let selectedAction = DealerAction.CardAction(rawValue: selectedNum) else {
            throw InputGuide.invalidCardAction
        }
        return selectedAction
    }

    func selectCardPackCount() throws -> Int {
        let inputValue: String = readLine() ?? "0"
        let selectedNum: Int = try getIntValue(inputValue: inputValue, min: 1, max: 9, message: InputGuide.wrongPackCount)
        return selectedNum
    }

    private func getIntValue(inputValue: String, min: Int, max: Int, message: Error) throws -> Int {
        guard let choice = Int(inputValue), choice >= min && choice <= max else {
            throw message
        }
        return choice
    }
    
}

typealias PokerInputView = InputView

extension PokerInputView {

    enum PokerInputGuide: String, Error {
        case pokerRules =
        """
        카드 게임 종류를 선택하세요.
        1. 7카드
        2. 5카드
        """
        case players = "참여할 사람의 인원을 입력하세요. (1 ~ 4)"
        case wrongPlayerCount = "가능한 인원은 1 ~ 4명 입니다."
        case invalidRules = "존재하지 않는 게임 종류입니다."
        case moreCard = "카드를 더 받으시겠습니까? (1.Go / 0. Stop)"
    }

    func selectRule() throws -> PokerGame.PokerRules {
        let inputValue: String = readLine() ?? "0"
        let selectedNum: Int = try getIntValue(inputValue: inputValue, min: 1, max: 2, message: InputGuide.wrongNum)
        guard let selectedRule = PokerGame.PokerRules(rawValue: selectedNum) else {
            throw PokerInputGuide.invalidRules
        }
        return selectedRule
    }

    func selectPlayerCount() throws -> Int {
        let inputValue: String = readLine() ?? "0"
        let selectedNum: Int = try getIntValue(inputValue: inputValue, min: 1, max: 4, message: PokerInputGuide.wrongPlayerCount)
        return selectedNum
    }

    func shouldMoreCard() throws -> Bool {
        let inputValue: String = readLine() ?? "0"
        guard let shouldMoreCard = Int(inputValue), shouldMoreCard >= 0 && shouldMoreCard <= 1 else {
            throw InputGuide.wrongNum
        }
        return shouldMoreCard == 1
    }

}
