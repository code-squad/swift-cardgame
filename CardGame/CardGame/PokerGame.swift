//
//  PokerGame.swift
//  CardGame
//
//  Created by BLU on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct PokerGame {
    
    enum Error: Swift.Error {
        case isCardDeckEmpty
        
        var localizedDescription: String {
            switch self {
            case .isCardDeckEmpty:
                return "카드덱이 비어있습니다."
            }
        }
    }
    
    private var cardDeck: Deck
    private var numberOfPlayers: NumberOfPlayers = .one
    private var mode: GameMode = .fiveCardStud
    private var pokerPresenter: PokerPresenter!
    
    init(cardDeck: Deck) {
        self.cardDeck = cardDeck
    }
    
    mutating func run(numberOfPlayers: NumberOfPlayers, option: GameMode) throws {
        self.numberOfPlayers = numberOfPlayers
        self.mode = option
        generatePlayers()
        try distributeCards()
    }
    
    mutating func generatePlayers() {
        let dealer = PokerDealer(deck: cardDeck)
        let players = (1..<numberOfPlayers.rawValue).map { PokerPlayer(number: $0) }
        pokerPresenter = PokerPresenter(dealer: dealer, players: players + [dealer])
    }
    
    mutating func distributeCards() throws {
        for _ in 0..<mode.rawValue {
            guard pokerPresenter.distributeCards() else {
                throw Error.isCardDeckEmpty
            }
        }
    }
}

extension PokerGame: OutputViewPrintable {
    func printPlayerInfo(handler: (String, String) -> ()) {
        for player in pokerPresenter.players() {
            handler(String(describing: player), player.cards())
        }
    }
}
