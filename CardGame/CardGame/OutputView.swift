//
//  OutputView.swift
//  CardGame
//
//  Created by joon-ho kil on 5/23/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    func printMessage (_ Participant: (players: [Player], dealer: Dealer)) {
        let playersSorted = Participant.players.sorted(by: { (playerBefore, playerAfter) -> Bool in
            return playerBefore.compareNameOrdered(otherPlayer: playerAfter)
        })
        
        for player in playersSorted {
            print(player)
        }
        
        print(Participant.dealer)
    }
    
    func printResult (_ champion: Player?, _ championName: String?) {
        if let _ = champion, let championName = championName {
            print("이번 게임의 승자는 \(championName) 입니다.")
        } else {
            print("이번 게임은 무승부입니다.")
        }
    }
}
