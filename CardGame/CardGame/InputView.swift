//
//  InputView.swift
//  CardGame
//
//  Created by Daheen Lee on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    static let menuRange = 1...3
    static let menuInstuction = """
                                다음 메뉴를 선택해주세요.
                                1. 카드 초기화
                                2. 카드 섞기
                                3. 카드 하나 뽑기
                                > 
                                """
    static func printMenu() {
        print(menuInstuction, terminator: "")
    }
    static func readMenu() -> Int {
        let input = readLine() ?? ""
        return Int(input) ?? 0
    }
}
