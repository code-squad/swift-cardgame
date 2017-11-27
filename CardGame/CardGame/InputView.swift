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
        0. 종료
        """
        case invalidInput = "보기의 번호 중에 숫자 한 개를 골라주세요."
        case wrongPackCount = "1부터 9 사이의 수를 골라주세요."
    }

    func readInput() throws -> Int {
        let inputValue: String = readLine() ?? "0"
        var selectedNum: Int = 0
        if let choice = Int(inputValue) {
            if choice < 0 || choice > 4 {
                throw InputGuide.invalidInput
            } else {
                selectedNum = choice
            }
        } else {
            throw InputGuide.invalidInput
        }
        return selectedNum
    }

    func getPackCount() throws -> Int {
        let inputValue: String = readLine() ?? "0"
        var packCount: Int = 0
        if let choice = Int(inputValue) {
            if choice < 1 || choice > 9 {
                throw InputGuide.wrongPackCount
            } else {
                packCount = choice
            }
        } else {
            throw InputGuide.wrongPackCount
        }
        return packCount
    }
    
}
