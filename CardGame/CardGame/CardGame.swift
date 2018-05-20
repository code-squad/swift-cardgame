//
//  CardGame.swift
//  CardGame
//
//  Created by moon on 2018. 5. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol CardDeckConvertible {
    func shuffleCards()
    func resetCards()
    func remove(numberOfCards: Int) -> [Card]
    func hasEnoughCards(numberOfCards: Int) -> Bool
}

class CardGame {
    private let validNumberOfPlayers: [Int] = [1, 2, 3, 4]
    private let gameMode: CardGameMode
    private var cardDeck = CardDeck()
    private var gamePlayers: GamePlayers
    private var dealer: GamePlayer = GamePlayer()
    
    init?(_ gameMode: CardGameMode, _ numberOfPlayers: Int) {
        guard self.validNumberOfPlayers.contains(numberOfPlayers) else {
            return nil
        }
        self.gameMode = gameMode
        self.gamePlayers = GamePlayers(numberOfPlayers: numberOfPlayers)
    }
    
    func resetGame() {
        self.cardDeck.resetCards()
        self.gamePlayers.reset()
        self.dealer.resetCards()
    }
    
    func shuffleCard() {
        self.cardDeck.shuffleCards()
    }
    
    func dealOutCard(_ numberOfPlayers: Int) -> Bool {
        guard self.cardDeck.hasEnoughCards(numberOfCards: self.gameMode.numberOfCards * (numberOfPlayers + 1)) else {
            return false
        }
        self.dealer.add(cards: cardDeck.remove(numberOfCards: gameMode.numberOfCards))
        self.gamePlayers.add(cardDeck: self.cardDeck, numberOfCards: self.gameMode.numberOfCards)
        return true
    }
    
    func sortCard() {
        self.gamePlayers.sortCard()
        self.dealer.sortCard()
    }
}

extension CardGame: CardGamePlayersPrintable {
    func printPlayerCards(_ handler: (GamePlayer) -> Void) {
        self.gamePlayers.printPlayersCards(handler)
    }
    
    func printDealerCards(by handler: (GamePlayer) -> Void) {
        handler(self.dealer)
    }
    
    func printWinnerOfPlayer(_ handler: (Int, PokerHands.Hand) -> Void) {
        let (winnerPlayerNumber, winnerPlayerHand) = self.gamePlayers.selectWinner()
        handler(winnerPlayerNumber, winnerPlayerHand)
    }
    
    func printDealerHand(_ handler: (PokerHands.Hand) -> Void) {
        handler(self.dealer.bestHand)
    }
    
    func printWinnerOfGame(_ handler: (String, PokerHands.Hand) -> Void) {
        let (_, winnerPlayerHand) = self.gamePlayers.selectWinner()
        let dealerHand = self.dealer.bestHand
        if winnerPlayerHand > dealerHand {
            handler("참가자", winnerPlayerHand)
        } else {
            handler("딜러", dealerHand)
        }
    }
}
