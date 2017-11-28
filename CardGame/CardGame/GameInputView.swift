//
//  GameInputView.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 28..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

struct GameInputView {

    enum InputGuide: String, Error {
        case pokerRules =
        """
        카드 게임 종류를 선택하세요.
        1. 7카드
        2. 5카드
        """
        case players = "참여할 사람의 인원을 입력하세요."
        case invalidInput = "보기의 번호 중에 숫자 한 개를 골라주세요."
        case wrongPlayerCount = "가능한 인원은 1 ~ 4명 입니다."
        case invalidRules = "존재하지 않는 게임 종류입니다."
    }

    func selectRule() throws -> PokerRules {
        let inputValue: String = readLine() ?? "0"
        var selectedNum: Int = 0
        var selectedRule: PokerRules
        if let choice = Int(inputValue) {
            if choice < 1 || choice > 2 {
                throw InputGuide.invalidInput
            } else {
                selectedNum = choice
            }
        } else {
            throw InputGuide.invalidInput
        }
        if let choice = PokerRules(rawValue: selectedNum) {
            selectedRule = choice
        } else {
            throw InputGuide.invalidRules
        }
        return selectedRule
    }

    func getPlayerCount() throws -> Int {
        let inputValue: String = readLine() ?? "0"
        var playerCount: Int = 0
        if let choice = Int(inputValue) {
            if choice < 1 || choice > 4 {
                throw InputGuide.wrongPlayerCount
            } else {
                playerCount = choice
            }
        } else {
            throw InputGuide.wrongPlayerCount
        }
        return playerCount
    }

}
