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
    private var option: GameMode = .fiveCardStud
    private var playerInfo: PokerPresenter!
    
    init(cardDeck: Deck) {
        self.cardDeck = cardDeck
    }
    
    mutating func run(numberOfPlayers: NumberOfPlayers, option: GameMode) throws -> PokerPresenter {
        self.numberOfPlayers = numberOfPlayers
        self.option = option
        try generatePlayers()
        try distributeCards()
        return playerInfo
    }
    
    mutating func generatePlayers() throws {
        let dealer = PokerDealer(deck: cardDeck)
        let players = (1..<numberOfPlayers.rawValue).map { PokerPlayer(number: $0) }
        playerInfo = PokerPresenter(dealer: dealer, players: players)
    }
    
    mutating func distributeCards() throws {
        for _ in 0..<option.rawValue {
            guard playerInfo.distributeCards() else {
                throw Error.isCardDeckEmpty
            }
        }
    }
}

extension PokerGame: OutputViewPrintable {
    func printPlayerInfo(handler: (String, String) -> ()) {
        for player in playerInfo.players() {
            handler(String(describing: player), player.cards())
        }
    }
}
