//
//  Game.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 28..
//  Copyright © 2017년 YUAMING. All rights reserved.
//

import Foundation

struct PokerGame {
    enum Menu: Int {
        case sevenCards = 1, fiveCards
    }
    
    static func start(choiceMenu: PokerGame.Menu, playerCount: Int) throws -> PokerGameData {
        let cardCount = choiceMenu == .sevenCards ? 7 : 5
        var dealer: Dealer = Dealer(deck: Deck())
        var players: [Player] = []
        
        for index in 1...playerCount {
            dealer = Dealer(deck: dealer.remainCards)
            let hand = Hand(cards: try dealer.dealCards(cardCount))
            let playerName = setPlayerName(index)
            let player = Player(hand: hand, name: playerName)
            players.append(player)
        }
        
        dealer = try haveCardsDealer(dealer: dealer, cardCount: cardCount)
        return endGame(dealer: dealer, players: players)
    }
    
    private static func haveCardsDealer(dealer: Dealer, cardCount: Int) throws -> Dealer {
        var _dealer = dealer
        return Dealer(hand: Hand(cards: try _dealer.dealCards(cardCount)), deck: _dealer.remainCards)
    }
    
    private static func setPlayerName(_ playerNumber: Int) -> String {
        return "참가자\(playerNumber)"
    }
    
    private static func endGame(dealer: Dealer, players: [Player]) -> PokerGameData {
        return PokerGameData(dealer: dealer, players: players)
    }
}
