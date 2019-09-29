//
//  InputView.swift
//  CardGame
//
//  Created by 공명진 on 2019/09/29.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    
    static func inputMenu() -> Int {
        print("다음 메뉴를 선택해주세요")
        print("1. 카드 초기화")
        print("2. 카드 섞기")
        print("3. 카드 하나 뽑기")
        print("4. 종료")
        print("> ", terminator: "")
        return inputMenuItem()
    }
    
    static private func inputMenuItem() -> Int {
        return Int(readLine() ?? "") ?? 4
    }
}
