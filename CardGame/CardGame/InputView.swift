//
//  InputView.swift
//  CardGame
//
//  Created by 윤동민 on 04/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct InputView {
    static func inputUser(message : String) -> String {
        print(message)
        print("1. 카드 초기화")
        print("2. 카드 섞기")
        print("3. 카드 하나 뽑기")
        print("> ", terminator : "")
        guard let input = readLine() else { return "" }
        return input
    }
}
