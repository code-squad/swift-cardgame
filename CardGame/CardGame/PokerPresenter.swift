//
//  PokerPresenter.swift
//  CardGame
//
//  Created by BLU on 16/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class PokerPresenter {
    private let pokerDealer: Dealer
    private let pokerPlayers: [Player]
    
    init(dealer: Dealer, players: [Player]) {
        self.pokerDealer = dealer
        self.pokerPlayers = players
    }
    
    func players() -> [Player] {
        return pokerPlayers
    }
}
