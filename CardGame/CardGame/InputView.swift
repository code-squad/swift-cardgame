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
        let menu = ["다음 메뉴를 선택해주세요", "1. 카드 초기화", "2. 카드 섞기", "3. 카드 하나 뽑기", "4. 종료"]
        menu.forEach { (menuItem) in
            print("\(menuItem)")
        }
        print("> ", terminator:"")
        return Int(readLine() ?? "") ?? 4
    }
    
    static func inputMenuPoker() -> (cardGame: Int, players: Int) {
        let menu = ["카드 게임 종류를 선택하세요.", "1. 7카드", "2. 5카드"]
        menu.forEach { (menuItem) in
            print("\(menuItem)")
        }
        print("> ", terminator:"")
        let cardGame = Int(readLine() ?? "") ?? 0
        
        print("참여할 사람의 인원을 입력하세요. (1 ~ 4)")
        print("> ", terminator:"")
        let players = Int(readLine() ?? "") ?? 0
        if players > 4 {
            print("4명 이하의 인원만 참여할 수 있어서 더 이상 진행 할 수 없습니다.")
        }
        
        return (cardGame, players)
    }
}
