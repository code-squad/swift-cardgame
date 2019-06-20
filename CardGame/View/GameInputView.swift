//
//  GameInputView.swift
//  CardGame
//
//  Created by jang gukjin on 20/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct GameInputView {
    static func announceGameType(totalCard remainingCard: Int) -> String {
        let gameSelectMent: String = """
                            카드 게임 종류를 선택하세요.(0을 입력하면 종료)
                            ** 남은 카드 (\(remainingCard)장) **
                            1. 7카드
                            2. 5카드
                            >
                            """
        print(gameSelectMent, terminator:"")
        let gameType = readLine()
        return gameType ?? ""
    }
    
    static func inputPlayerNumber() -> String {
        let playerCountMent: String = """
                                    참여할 사람의 인원을 입력하세요.
                                    >
                                    """
        print(playerCountMent, terminator:"")
        let playerCount = readLine()
        return playerCount ?? ""
    }
}
