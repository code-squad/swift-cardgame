//
//  InputView.swift
//  CardGame
//
//  Created by moon on 2018. 5. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

enum Question: String {
    case menu = "다음 메뉴를 선택해주세요. \n1. 카드초기화\n2. 카드 섞기\n3. 카드 하나 뽑기\n>"
}

struct InputView {
    
    static func readInput(question: Question) -> String {
        print(question.rawValue, terminator: " ")
        guard let input = readLine() else {
            fatalError("Nil Input")
        }
        return input
    }
}
