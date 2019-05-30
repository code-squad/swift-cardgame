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
        let playersSorted = Participant.players.sorted(by: { (arg0, arg1) -> Bool in
            return arg0.getName() < arg1.getName()
        })
        
        for player in playersSorted {
            print(player)
        }
        
        print(Participant.dealer)
    }
    
    func printResult (_ players: [Player]) {
        let playersSorted = players.sorted(by: { (arg0, arg1) -> Bool in
            return arg0.getScore() > arg1.getScore()
        })
        
        print("이번 게임의 승자는 \(playersSorted[0].getName()) 입니다.")
//      이번 게임의 승자는 참가자#2 입니다.
    }
}
