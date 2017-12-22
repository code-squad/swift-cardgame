//
//  InputView.swift
//  CardGame
//
//  Created by Eunjin Kim on 2017. 12. 22..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class InputView {
    func printMenu() -> Int {
        print("\n다음 메뉴를 선택해주세요.\n1. 카드 초기화\n2. 카드 섞기\n3. 카드 하나 뽑기\n4. 이제 안녕~\n>", terminator: " ")
        let inputNumber = readLine()
        guard let numberOfMenu = Int(inputNumber!) else {
            print("-- 다시 입력하세요 --\n")
            return -1
        }
        return numberOfMenu
    }
    
}
