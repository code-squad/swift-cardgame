//
//  InputView.swift
//  CardGame
//
//  Created by 김장수 on 03/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct InputView {
    static func readStart() -> String {
        print("다음 메뉴(종료하려면 q 또는 quit을 입력)를 선택해주세요.")
        print("1. 카드 초기화")
        print("2. 카드 섞기")
        print("3. 카드 하나 뽑기")
        return readLine() ?? ""
    }
}
