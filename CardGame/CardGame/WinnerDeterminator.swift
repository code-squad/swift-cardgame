//
//  WinnerDeterminator.swift
//  CardGame
//
//  Created by Daheen Lee on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct WinnerDeterminator {
    static func determineWinner(among players: [Player]) -> Player {
        var playerDecisionPairs = players.map { ($0, $0.determineWinningPokerHand()) }
        var (winner, winningDecision) = playerDecisionPairs[0]
        for i in 1..<playerDecisionPairs.count {
            let (comparingPlayer, comparingDecision) = playerDecisionPairs[i]
            if check(comparingDecision: comparingDecision, higherThan: winningDecision) {
                winner = comparingPlayer
                winningDecision = comparingDecision
            }
        }
        return winner
    }
    
    static func check(comparingDecision: Decision, higherThan currentWinningDecision: Decision) -> Bool {
        if currentWinningDecision.hand == comparingDecision.hand {
            return currentWinningDecision.highestRank < comparingDecision.highestRank
        }
        return currentWinningDecision.hand < comparingDecision.hand
    }
}
