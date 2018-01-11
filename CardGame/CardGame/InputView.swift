//
//  InputView.swift
//  CardGame
//
//  Created by YOUTH on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class InputView {
    
    enum consoleDescription: String {
        case menuOption = "다음 메뉴를 선택해주세요.\n 1. 카드 초기화\n 2. 카드 섞기\n 3. 카드 하나 뽑기\n"
    }
    
    func askUserInput(text: String) -> String {
        print(text)
        let userInput = readLine()
        guard let input = userInput else {
            return ""
        }
        return input
    }
}
