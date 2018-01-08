//
//  HandEvaluator.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 28..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct HandEvaluator {
    private let hand: Hand
    
    init(hand: Hand) {
        self.hand = hand
    }
    
    func evaluateHand() -> HandType {        
        return Hand(cards: hand.cardsInformation).giveScore()
    }
    
    static func decideWinner(playersData: [(Player, HandType)]) -> (Player, HandType) {
        var winnerData = playersData.sorted { $0.1 < $1.1 }
        return winnerData[winnerData.count-1]
    }
}
