//
//  OutputView.swift
//  CardGame
//
//  Created by 조재흥 on 18. 12. 6..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static func outputState(ment:String) {
        print(ment)
    }
    
    static func outputPlayers(players:[GamePlayer]) {
        for player in players {
            print(player)
        }
    }
    
    static func announceTheWinner(players:[GamePlayer]) {
        let winner = players.max { playerA, playerB in playerA.score() < playerB.score()}
        guard let winnerDescription = winner?.description else {return}
        print("\n우승자는 \(winnerDescription)입니다!\n")
    }
}

