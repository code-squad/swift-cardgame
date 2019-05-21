//
//  InputView.swift
//  CardGame
//
//  Created by joon-ho kil on 5/21/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    private(set) var valueEntered: String = ""
    
    func printMenu () {
        print("다음 메뉴를 선택해주세요.")
        print("1. 카드 초기화")
        print("2. 카드 섞기")
        print("3. 카드 하나 뽑기")
    }
    
    mutating func readInput () {
        print("> ", terminator: "")
        valueEntered = readLine() ?? "0"
    }
}
