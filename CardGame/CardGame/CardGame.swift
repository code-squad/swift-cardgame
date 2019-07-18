//
//  CardGame.swift
//  CardGame
//
//  Created by 이진영 on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGame {
    private let dealer: Dealable
    private let players: [Playable]
    private let gameMenu: GameMenu
    
    init(dealer: Dealable, players: [Playable], gameMenu: GameMenu) {
        self.dealer = dealer
        self.players = players
        self.gameMenu = gameMenu
    }
    
    private func distributeCards(menu: GameMenu) throws {
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
    
    func run() throws {
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
