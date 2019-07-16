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
    private var option: GameOption = .fiveCardStud
    private var playerInfo = PlayerInfo()
    
    init(cardDeck: Deck) {
        self.cardDeck = cardDeck
    }
    
    mutating func run(numberOfPlayers: NumberOfPlayers, option: GameOption) throws {
        self.numberOfPlayers = numberOfPlayers
        self.option = option
        try generatePlayers()
    }
    
    mutating func generatePlayers() throws {
        var dealer: Dealer & Player = PokerDealer(deck: cardDeck)
        let players: [Player] = PlayerGenerator.generatePlayers(by: numberOfPlayers.rawValue)
        for var player in players + [dealer] {
            try distributeCards(from: &dealer, to: &player)
            playerInfo.addPlayer(player)
        }
    }
    
    mutating func distributeCards(from dealer: inout Dealer & Player, to player: inout Player) throws {
        for _ in 0..<option.rawValue {
            guard let card = dealer.draw() else {
                throw Error.isCardDeckEmpty
            }
            player.take(card: card)
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
