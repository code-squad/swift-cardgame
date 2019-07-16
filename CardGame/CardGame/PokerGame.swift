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
    
    private var dealer: Dealer
    private var players: [Player]
    private let option: GameOption
    private var playerInfo = PlayerInfo()
    
    init(dealer: Dealer & Player, players: [Player], option: GameOption) {
        self.dealer = dealer
        self.players = players + [dealer]
        self.option = option
    }
    
    mutating func run() throws {
        try generatePlayers()
    }
    
    mutating func drawCards() throws -> [Card] {
        var cards = [Card]()
        for _ in 0..<option.numberOfCards {
            guard let card = dealer.draw() else {
                throw Error.isCardDeckEmpty
            }
            cards.append(card)
        }
        return cards
    }
    
    mutating func generatePlayers() throws {
        let times = option.numberOfCards
        for _ in 0..<times {
            for index in 0..<self.players.count {
                guard let card = dealer.draw() else {
                    throw Error.isCardDeckEmpty
                }
                self.players[index].receive(card: card)
                playerInfo.addPlayer(self.players[index])
            }
        }
    }
    
    mutating func distributeCards(from dealer: inout Dealer, to player: inout Player) throws {
        for _ in 0..<option.numberOfCards {
            guard let card = dealer.draw() else {
                throw Error.isCardDeckEmpty
            }
            player.receive(card: card)
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
