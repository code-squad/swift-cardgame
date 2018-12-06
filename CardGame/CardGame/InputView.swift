//
//  InputView.swift
//  CardGame
//
//  Created by 김장수 on 03/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct InputView {
    func readGameMode() -> String {
        print("카드 게임 종류를 선택하세요.")
        print("1. 7카드")
        print("2. 5카드")
        
        return readLine() ?? ""
    }
    
    func readPlayersNumber() -> String {
        print("참여할 사람의 인원을 입력하세요.")
        print("최대 4명까지 가능합니다.")
        
        return readLine() ?? ""
    }
}
