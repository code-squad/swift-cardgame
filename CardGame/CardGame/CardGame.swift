//
//  CardGame.swift
//  CardGame
//
//  Created by moon on 2018. 5. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol CardDeckConvertible {
    mutating func shuffleCard()
    mutating func resetCard()
    mutating func remove(numberOfCards: Int) -> [Card]
}

class CardGame {
    private let validNumberOfPlayers: [Int] = [1, 2, 3, 4]
    private let gameMode: CardGameMode
    private let numberOfPlayers: Int
    private var cardDeck: CardDeckConvertible = CardDeck()
    private var gamePlayers: GamePlayers
    private var dealer: GamePlayer
    private var numberOfCards: Int {
        switch self.gameMode {
        case .fiveCardStud:
            return 5
        case .sevenCardStud:
            return 7
        }
    }
    
    init?(_ gameMode: CardGameMode, _ numberOfPlayers: Int) {
        guard self.validNumberOfPlayers.contains(numberOfPlayers) else {
            return nil
        }
        self.gameMode = gameMode
        self.numberOfPlayers = numberOfPlayers
        self.gamePlayers = GamePlayers(numberOfPlayers: self.numberOfPlayers)
        self.dealer = GamePlayer()
    }
    
    func resetGame() {
        self.cardDeck.resetCard()
        self.gamePlayers = GamePlayers(numberOfPlayers: self.numberOfPlayers)
        self.dealer = GamePlayer()
    }
    
    func shuffleCard() {
        self.cardDeck.shuffleCard()
    }
    
    func dealOutCard() {
        for playerNumber in 0..<self.numberOfPlayers {
            self.gamePlayers.add(cards: self.cardDeck.remove(numberOfCards: self.numberOfCards), to: playerNumber)
        }
        self.dealer.add(cards: self.cardDeck.remove(numberOfCards: self.numberOfCards))
    }
}

extension CardGame: CardGamePlayersPrintable {
    func descriptionOfPlayers() -> String {
        var allPlayersDescription: String = String()
        for playerNumber in 0..<self.numberOfPlayers {
            allPlayersDescription += "\(self.gamePlayers.descriptionOfPlayer(playerNumber))\n"
        }
        return allPlayersDescription
    }
    
    func descriptionOfDealer() -> String {
        return "딜러 \(self.dealer.description)"
    }
}
