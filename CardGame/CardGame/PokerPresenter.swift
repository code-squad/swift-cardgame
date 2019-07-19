//
//  PokerPresenter.swift
//  CardGame
//
//  Created by BLU on 16/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class PokerPresenter {
    private let pokerDealer: CardDealing
    private let pokerPlayers: [Playable]
    
    init(dealer: CardDealing, players: [Playable]) {
        self.pokerDealer = dealer
        self.pokerPlayers = players
    }
    
    func distributeCards() {
        for player in pokerPlayers {
            guard let card = pokerDealer.draw() else {
                return
            }
            player.take(card: card)
        }
    }
    
    func players() -> [Playable] {
        return pokerPlayers
    }
}
