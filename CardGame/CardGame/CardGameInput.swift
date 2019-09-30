//
//  UserInput.swift
//  CardGame
//
//  Created by temphee.Reid on 01/10/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation


protocol InputReadable {
    func read() -> String
}

struct CardGameInput : InputReadable {
    
    func showMenu() -> Void {
        print("다음 메뉴를 선택해 주세요")
        print("1. 카드 초기화")
        print("2. 카드 섞기")
        print("3. 카드 하나 뽑기")
        print("> ", terminator: "")
    }
    
    func read() -> String {
        showMenu()
        let choice = readLine() ?? ""
        return choice
    }
}
