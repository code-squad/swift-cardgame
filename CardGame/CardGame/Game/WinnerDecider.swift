//
//  WinnerDecider.swift
//  CardGame
//
//  Created by CHOMINJI on 07/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct WinnerDecider {
    static func decideWinner(of players: [Playerable]) -> Playerable {
        let sortedByHand = players.sorted {
            if $0.bestHand().value == $1.bestHand().value {
                return $0.bestHand().key < $1.bestHand().key
            }
            return $0.bestHand().value < $1.bestHand().value
        }
        let winner = sortedByHand[players.count - 1]
        return winner
    }
}
