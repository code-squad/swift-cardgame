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
    private let pokerRule: PokerRules
    private var dealerAction: DealerAction

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

    init(dealerAction: DealerAction, playerCount: Int, pokerRule: PokerRules) {
        for i in 1...playerCount {
            players.append(Player.init(name: "참가자#\(i)"))
        }
        self.pokerRule = pokerRule
        self.dealerAction = dealerAction
    }

    mutating func setPokerGame() throws {
        for _ in 1...getAvailableTurnCount() {
            do {
                try nextTurn()
            } catch {
                throw GuideMessage.notEnoughCard
            }
        }
    }

    mutating func nextTurn() throws {
        guard players.count+1 < dealerAction.count() else {
            throw GuideMessage.notEnoughCard
        }
        for i in 0..<players.count {
            players[i].callNewCard(try dealerAction.removeOne())
        }
        dealer.callNewCard(try dealerAction.removeOne())
    }

    private func getAvailableTurnCount() -> Int {
        return Int(pokerRule.value/2)
    }

    mutating func play(pokerRule: PokerRules) throws {
        for _ in 0..<(pokerRule.value-Int(pokerRule.value/2)) {
            do {
                try nextTurn()
            } catch {
                throw GuideMessage.notEnoughCard
            }
        }
    }

}

typealias PokerWinnerChecker = PokerGame

extension PokerWinnerChecker {

    func findWinner() -> Player {
        var allPlayer = players
        allPlayer.append(dealer)
        allPlayer.sort()
        return allPlayer.last!
    }

}
