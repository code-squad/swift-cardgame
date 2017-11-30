//
//  PokerGame.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 28..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

struct PokerGame {
    private(set) var players: Array<Player> = []
    private(set) var dealer: Player = Player.init(name: "dealer")
    private(set) var cardDeck: CardDeck
    let pokerRule: PokerRules

    enum GuideMessage: String, Error {
        case notEnoughCard = "더이상 카드가 모두에게 돌아갈 수 없습니다."
    }

    enum PokerRules: Int {
        case none, sevenStud, fiveStud

        var value: Int {
            switch self {
            case .sevenStud:
                return 7
            case .fiveStud:
                return 5
            case .none:
                return 0
            }
        }
    }

    init(cardDeck: CardDeck, playerCount: Int, pokerRule: PokerRules) {
        for i in 1...playerCount {
            players.append(Player.init(name: "참가자#\(i)"))
        }
        self.cardDeck = cardDeck
        self.pokerRule = pokerRule
    }

    mutating func nextTurn() throws {
        guard players.count+1 < cardDeck.count() else {
            throw GuideMessage.notEnoughCard
        }
        for i in 0..<players.count {
            players[i].callNewCard(try cardDeck.removeOne())
        }
        dealer.callNewCard(try cardDeck.removeOne())
    }

}
