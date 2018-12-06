//
//  CardGame.swift
//  CardGame
//
//  Created by 김장수 on 06/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum GameType: String {
    case seven = "1"
    case five = "2"
    
    var mode: Int {
        switch self {
        case .seven:
            return 7
        case .five:
            return 5
        }
    }
    
}

class CardGame {
    private var cardDeck: CardDeck
    private var mode: GameType
    private var number: Int
    private var players = [Player]()
    
    init(cardDeck: CardDeck, mode: GameType, number: Int) {
        self.cardDeck = cardDeck
        self.mode = mode
        self.number = number
        self.setPlayers()
    }
    
    private func setPlayers() {
        self.cardDeck.reset()
        
        for i in 0..<number {
            let player = Player(name: PlayerType.player(i))
            players.append(player)
        }
        
        let dealer = Player(name: PlayerType.dealer)
        players.append(dealer)
    }
    
    func play() {
        for player in players {
            let newStack = cardDeck.drawCardStud(of: mode)
            player.get(newStack)
        }
    }
    
    func playerStatus() -> [Player] {
        return self.players
    }
    
    func countOfCards() -> Int {
        return self.cardDeck.count()
    }
}
