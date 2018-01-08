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
        let playersData = players.map({ player -> (Player, HandType) in
            (player, HandEvaluator(hand: player.handInformation).evaluateHand())
        })

        return HandEvaluator.decideWinner(playersData: playersData)
    }
}
