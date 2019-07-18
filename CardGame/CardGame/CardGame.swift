//
//  CardGame.swift
//  CardGame
//
//  Created by 이진영 on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGame {
    private var dealer: Dealable
    private var players: [Playable] = []
    
    init(dealer: Dealable) {
        self.dealer = dealer
    }
    
    private mutating func distributeCards(menu: GameMenu) throws {
        for _ in 1...menu.numberOfCards {
            for player in players {
                guard let card = dealer.give() else {
                    throw CardDeckError.cardDeckEmpty
                }
                
                player.receive(card: card)
            }
            
            guard let card = dealer.give() else {
                throw CardDeckError.cardDeckEmpty
            }
            
            dealer.receive(card: card)
        }
    }
    
    mutating func run(gameMenu: GameMenu, players: [Playable]) throws {
        self.players = players
        
        try distributeCards(menu: gameMenu)
    }
}

extension CardGame: OutputViewPrintable {
    func printPlayerInformation(handler: @escaping (String, [Card]) -> ()) {
        for player in players {
            player.getPlayerInformation(handler: handler)
        }

        dealer.getPlayerInformation(handler: handler)
    }
}
