//
//  CardBattle.swift
//  CardGame
//
//  Created by jang gukjin on 22/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardBattle {
    /// 각 선수들의 결과를 비교하여 승자를 반환하는 함수
    func compareCard(players: [Player]) -> Player{
        let check = CardResult()
        var result: Int = 0
        var winner: Player = players[0]
        var participants = players
        participants.removeLast()
        for player in participants {
            let totalScore = check.judgeByRule(of: player.cards).convertedScore
            if totalScore > result {
                result = totalScore
                winner = player
            }
        }
        return winner
    }
    
    /// 승자를 출력형식으로 바꿔주는 함수
    func winMent(winner: Player) -> String{
        return "이번 게임의 승자는 \(winner.getName()) 입니다."
    }
}
