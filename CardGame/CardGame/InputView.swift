//
//  InputView.swift
//  CardGame
//
//  Created by joon-ho kil on 5/21/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    func printMenu () {
        print("카드 게임 종류를 선택하세요.")
        print("1. 7카드")
        print("2. 5카드")
        print("9. 종료")
    }
    
    func printPeopleInput () {
        print("참여할 사람의 인원을 입력하세요.")
    }
    
    func readInput () -> String {
        print("> ", terminator: "")
        return readLine() ?? "0"
    }
}
