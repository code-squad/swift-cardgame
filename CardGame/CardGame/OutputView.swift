//
//  OutputView.swift
//  CardGame
//
//  Created by 윤동민 on 04/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct OutputView {
    // 사용자들의 카드패를 출력
    static func printPlayerCasds(with players: Players) {
        var playerNumber = 1
        for player in players.players {
            if case is Player = player { print("참가자#\(playerNumber) \(player.cards)") }
            else { print("딜러 \(player.cards) ") }
            playerNumber += 1
        }
    }
}


