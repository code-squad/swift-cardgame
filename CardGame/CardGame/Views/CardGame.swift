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
    func printPlayerInfo(handler: (String, String) -> ()) {
        players.forEach { player in handler(player.name, String(describing: player.hand))}
    }
    
    private var players: [Player]
    private var dealer: Dealer
    private let gameMode: CardGameMode
    private let numOfPlayers: Int
    
    init(players: [Player], dealer: Dealer, gameMode: CardGameMode, numberOfPlayers: Int) {
        self.dealer = dealer
        self.players = players
        self.gameMode = gameMode
        self.numOfPlayers = numberOfPlayers
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
        for order in 1...self.numOfPlayers {
            players.append(PokerPlayer(hand: Hand.init(), number: order))
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
