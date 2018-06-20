//
//  InputView.swift
//  CardGame
//
//  Created by Yoda Codd on 2018. 6. 20..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
/// 사용자 입력 종류
enum CardMenu {
    case reset
    case shuffle
    case removeOne
}

struct InputView {
    /// 메뉴 메세지 출력
    func printMenuMessage(){
        print ("""
다음 메뉴를 선택해주세요.
1. 카드 초기화
2. 카드 섞기
3. 카드 하나 뽑기
""")
    }
    
    /// 유저입력을 받아서 리턴하는 함수
    func requestUserInput() -> String {
        return readLine()!
    }
    
    /// 유저입력값이 메뉴에 있는지 체크
    func checkUserInput(userInput: String) -> CardMenu? {
        switch userInput {
        case "1" : return CardMenu.reset
        case "2" : return CardMenu.shuffle
        case "3" : return CardMenu.removeOne
        default : return nil
        }
    }
    
    /// 유저입력을 받아서 리턴하는 함수
    func getUserInput() -> CardMenu? {
        printMenuMessage()
        let userInput = requestUserInput()
        let result = checkUserInput(userInput: userInput)
        return result
    }
}
