//
//  PokerGameData.swift
//  CardGame
//
//  Created by yuaming on 2018. 1. 4..
//  Copyright © 2018년 YUAMING. All rights reserved.
//

import Foundation

struct PokerGameData {
    private let dealer: Dealer
    private let players: [Player]
    
    init(dealer: Dealer, players: [Player]) {
        self.dealer = dealer
        self.players = players
    }
    
    var dealerInformation: Dealer {
        return self.dealer
    }
    
    var playersInformation: [Player] {
        return self.players
    }
}

extension PokerGameData {
    func confirmWinner() -> (Player, HandType) {
        var result = players.map({ player -> (Player, HandType) in
            (player, HandEvaluator(hand: player.handInformation).evaluateHand())
        }).sorted { $0.1.rawValue < $1.1.rawValue }
        
        return result[result.count-1]
    }
}
