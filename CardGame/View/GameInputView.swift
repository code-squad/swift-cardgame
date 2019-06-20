//
//  GameInputView.swift
//  CardGame
//
//  Created by jang gukjin on 20/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct GameInputView {
    static func announceMent() -> (gameType: String, playerCount: String) {
        let gameSelectMent: String = """
                            카드 게임 종류를 선택하세요.
                            1. 7카드
                            2. 5카드
                            >
                            """
        let playerCountMent: String = """
                                    참여할 사람의 인원을 입력하세요.
                                    >
                                    """
        print(gameSelectMent, terminator:"")
        let gameType = readLine()
        print(playerCountMent, terminator:"")
        let playerCount = readLine()
        return (gameType: gameType ?? "", playerCount: playerCount ?? "")
    }
}
