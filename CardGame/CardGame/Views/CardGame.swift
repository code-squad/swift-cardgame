//
//  CardGame.swift
//  CardGame
//
//  Created by JieunKim on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol OutputViewPrintable {
    func printPlayerInfo(handler: (String, String) -> ())
}

class CardGame: OutputViewPrintable {
    private var players: [Player] = []
    private var dealer: Dealer
    private let gameMode: CardGameMode
    private let numberOfPlayers: Int
    
    func printPlayerInfo(handler: (String, String) -> ()) {
        players.forEach { player in handler(player.name, String(describing: player.hand))}
    }

    init( dealer: Dealer, gameMode: CardGameMode, numberOfPlayers: Int) {
        self.dealer = dealer
        self.gameMode = gameMode
        self.numberOfPlayers = numberOfPlayers
        
    }
    
    private func continueGame() -> Bool {
        let numberOfCards = gameMode.numberOfCards
        let requirement = numberOfCards * players.count
        return dealer.haveCards(requirement: requirement)
    }
    
    func gameStart() {
        guard continueGame() else { return }
        setPlayer()
        setCards()
    }
    
    private func setPlayer() {
        for order in 1...self.numberOfPlayers {
            players.append(PokerPlayer( number: order))
        }
        players.append(dealer)
    }
    
    private func setCards() {
        let numberOfCards = gameMode.numberOfCards
       
        for  _ in 1...numberOfCards {
            for index in 0..<players.endIndex {
                guard let card = self.dealer.give() else {
                    return
                }
                players[index].receive(newCards: card)
            }
        }
    }
}
