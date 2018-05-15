//
//  CardGame.swift
//  CardGame
//
//  Created by moon on 2018. 5. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol CardDeckConvertible {
    func shuffleCard()
    func resetCard()
    func remove(numberOfCards: Int) -> [Card]
    func hasEnoughCards(numberOfCards: Int) -> Bool
}

class CardGame {
    private let validNumberOfPlayers: [Int] = [1, 2, 3, 4]
    private let gameMode: CardGameMode
    private var cardDeck = CardDeck()
    private var gamePlayers: GamePlayers
    private var dealer: GamePlayer
    
    init?(_ gameMode: CardGameMode, _ numberOfPlayers: Int) {
        guard self.validNumberOfPlayers.contains(numberOfPlayers) else {
            return nil
        }
        self.gameMode = gameMode
        self.gamePlayers = GamePlayers(numberOfPlayers: numberOfPlayers)
        self.dealer = GamePlayer()
    }
    
    func resetGame() {
        self.cardDeck.resetCard()
        self.gamePlayers.reset()
        self.dealer.resetCards()
    }
    
    func shuffleCard() {
        self.cardDeck.shuffleCard()
    }
    
    func dealOutCard() -> Bool {
        return self.gamePlayers.add(cardDeck: self.cardDeck, numberOfCards: self.gameMode.numberOfCards)
    }

}

extension CardGame: CardGamePlayersPrintable {
    func descriptionOfPlayer() -> String {
        return ""
    }
    
    func descriptionOfDealer() -> String {
        return "딜러 \(self.dealer.description)"
    }
}
