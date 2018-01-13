//
//  File.swift
//  CardGame
//
//  Created by jack on 2018. 1. 13..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct HandEvaluator {
    
    private var handsOfPlayers : [Hand] = []
    private var stacksOfPlayers : [[Card]] = []

    init(_ userStacks : [[Card]]) {
        self.stacksOfPlayers = userStacks
        for indexOfStack in 0..<userStacks.count {
            handsOfPlayers.append(Hand.init(userStacks[indexOfStack]))
        }
    }
    
    func generateHandOfWinner() -> WinnerInfo {
        var evaluatedHands = self.handsOfPlayers.sorted { $0.hand.hashValue > $1.hand.hashValue }
        if evaluatedHands.count != 1 && evaluatedHands[0].hand == evaluatedHands[1].hand {
            evaluatedHands = [evaluatedHands[0],evaluatedHands[1]].sorted { $0.pairVal.hashValue > $1.pairVal.hashValue}
        }
        let handOfWinner = evaluatedHands[0].hand
        let numberOfWinner = self.handsOfPlayers.index(where: {$0.hand == evaluatedHands[0].hand}) ?? 0
        return WinnerInfo.init(handOfWinner, numberOfWinner)
    }
    
}
